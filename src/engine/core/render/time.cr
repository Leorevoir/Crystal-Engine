module RenderLoop

    ####################################################################
    # DeltaTime
    # Float64 to be have more precise time inputs
    struct DeltaTime
        @delta : Float64 = 0.0_f64

        def initialize(@frame_time : Float64, @passed_time : Float64, @start_time : Float64)
            @delta = Time.monotonic.total_seconds
        end

    end

end
