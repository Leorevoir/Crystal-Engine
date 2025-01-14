module RenderLoop

    class Render

        @is_running : Bool = false
        @frame_time : Float64 = 0.0f64

        def initialize(@game : Game, fps : Float64)
            @frame_time = 1.0f64 / fps
        end

        # entry point
        def start(window : Window)
            return if @is_running
            run(window)
        end

        private def run(window : Window)
            @is_running = true

            frames = 0
            frame_counter = 0

            last_time = Time.monotonic.total_seconds
            unprocessed_time = 0.0f64

            while @is_running
                should_render = false

                # simply get last_time
                start_time = Time.monotonic.total_seconds
                passed_time = start_time - last_time
                last_time = start_time

                unprocessed_time += passed_time
                frame_counter += passed_time

                # game process
                while unprocessed_time > @frame_time
                    should_render = true
                    unprocessed_time -= @frame_time

                    if window.should_close?
                        stop
                    end

                    DeltaTime.new(@frame_time, passed_time, start_time)

                    @game.input
                    @game.update

                    if (frame_counter >= 1.0)
                        puts "fps: #{frames}"
                        frames = 0
                        frame_counter = 0
                    end

                end

                # only render if necessary
                if should_render
                    render window
                    frames = frames + 1
                else
                    # sleep thread for 1 millisecond
                    sleep(Time::Span.new(nanoseconds: 1000000))
                end
            end

            cleanup window
        end

        private def render(window : Window)
            window.render
            @game.render
        end

        private def cleanup(window : Window)
            window.destroy
        end

        # entry point
        def stop
            return unless @is_running
            @is_running = false
        end

    end

end
