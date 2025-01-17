module RenderLoop

    # TODO: maybe only create a module instead of a class
    class RenderUtil

        def self.clear_screen
            #TODO: Stencil buffer
            LibGL.clear(LibGL::COLOR_BUFFER_BIT | LibGL::DEPTH_BUFFER_BIT)
        end

        def self.init_graphics
            LibGL.clear_color(1.0_f32, 1.0_f32, 0.0_f32, 0.0_f32)
            Log.info "viewport size: #{LibGL::VIEWPORT}"

            LibGL.front_face(LibGL::CW)
            LibGL.cull_face(LibGL::BACK)
            # INFO: culling is for 3D objects
            # LibGL.enable(LibGL::CULL_FACE)
            LibGL.enable(LibGL::DEPTH_TEST)

            #TODO:Depth clamp for later
            LibGL.enable(LibGL::FRAMEBUFFER_SRGB)
        end

        def self.flush
            LibGL.flush
        end

    end

    class Render

        @is_running : Bool = false
        @frame_time : Float32 = 0.0_f32

        def initialize(@game : Game, @window : Window, fps : Float32)
            @frame_time = 1.0_f32 / fps
            @input = Event::Input.new @window
            @game.register_input @input
            RenderLoop::RenderUtil.init_graphics
        end

        ####################################################################
        # entry point
        # starts the engine
        def start
            return if @is_running
            run
        end

        ####################################################################
        # called by start
        # core render loop
        # TODO: refactor render loop
        private def run
            return if @is_running
            @is_running = true


            frames = 0
            frame_counter = 0

            last_time = Time.monotonic.total_seconds
            unprocessed_time = 0.0_f32

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

                    if @window.should_close?
                        stop
                    end

                    stop if @window.key_pressed? Event::Input::Escape

                    DeltaTime.new(@frame_time, passed_time, start_time)

                    @input.update
                    @game.input
                    @game.update

                    if (frame_counter >= 1.0)
                        Log.info "fps: #{frames}"
                        frames = 0
                        frame_counter = 0
                    end

                end

                ####################################################################
                # only render if necessary
                if should_render
                    render
                    frames += 1
                else
                    ####################################################################
                    # sleep thread for 1 millisecond
                    sleep(Time::Span.new(nanoseconds: 1_000_000))
                end
            end

            cleanup
        end

        private def render
            RenderUtil.clear_screen
            @game.render
            @window.render
            RenderUtil.flush
        end

        private def cleanup
            @window.destroy
        end

        ####################################################################
        # entry point to stop the engine
        def stop
            return unless @is_running
            @is_running = false
        end

    end

end
