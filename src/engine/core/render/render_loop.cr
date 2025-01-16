module RenderLoop

    class RenderUtil

        def self.clear_screen
            #TODO: Stencil buffer
            LibGL.clear_color(0.0, 0.0, 0.0, 0.0)
            LibGL.clear(LibGL::COLOR_BUFFER_BIT | LibGL::DEPTH_BUFFER_BIT)
        end

        def self.init_graphics
            LibGL.front_face(LibGL::CW)
            LibGL.cull_face(LibGL::BACK)
            LibGL.enable(LibGL::CULL_FACE)
            LibGL.enable(LibGL::DEPTH_TEST)

            #TODO:Depth clamp for later
            LibGL.enable(LibGL::FRAMEBUFFER_SRGB)
        end

    end

    class Render

        @is_running : Bool = false
        @frame_time : Float64 = 0.0f64

        def initialize(@game : Game, fps : Float64)
            @frame_time = 1.0f64 / fps
            RenderLoop::RenderUtil.init_graphics
        end

        ####################################################################
        # entry point
        # starts the engine
        def start(window : Window)
            return if @is_running
            run(window)
        end

        ####################################################################
        # called by start
        # core render loop
        # TODO: refactor render loop
        private def run(window : Window)
            @is_running = true

            input = Event::Input.new window

            frames = 0
            frame_counter = 0

            last_time = Time.monotonic.total_seconds
            unprocessed_time = 0.0f64

            ####################################################################
            # start loop
            while @is_running
                should_render = false

                ####################################################################
                # time computing
                start_time = Time.monotonic.total_seconds
                passed_time = start_time - last_time
                last_time = start_time
                unprocessed_time += passed_time
                frame_counter += passed_time

                ####################################################################
                # game process
                while unprocessed_time > @frame_time
                    should_render = true
                    unprocessed_time -= @frame_time
                    LibGLFW.poll_events

                    if window.should_close?
                        stop
                    end

                    input.update
                    stop if window.key_pressed? Event::Key::Escape

                    DeltaTime.new(@frame_time, passed_time, start_time)

                    # ISSUE: inputs appears more than once
                    @game.input input
                    @game.update

                    if (frame_counter >= 1.0)
                        puts "fps: #{frames}"
                        frames = 0
                        frame_counter = 0
                    end

                end

                ####################################################################
                # only render if necessary
                if should_render
                    render window
                    frames = frames + 1
                else
                    ####################################################################
                    # sleep thread for 1 millisecond
                    sleep(Time::Span.new(nanoseconds: 1000000))
                end
            end

            cleanup window
        end

        private def render(window : Window)
            RenderUtil.clear_screen
            @game.render
            window.render
        end

        private def cleanup(window : Window)
            window.destroy
        end

        ####################################################################
        # entry point to stop the engine
        def stop
            return unless @is_running
            @is_running = false
        end

    end

end
