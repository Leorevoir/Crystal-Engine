module Maths

    ####################################################################
    # Vector2f
    # of 2 float64
    struct Vector2f

        getter x : Float64
        getter y : Float64
        protected setter x : Float64
        protected setter y : Float64

        def initialize(@x : Float64, @y : Float64)
        end

        def length : Float64
            Math.sqrt(x * x + y * y)
        end

        def dot(other : Vector2f) : Float64
            x * other.x + y * other.y
        end

        def normalize : Vector2f
            vec_len : Float64 = length

            @x /= vec_len
            @y /= vec_len
            return self
        end

        def rotate(angle : Float64) : Vector2f
            rad : Float64 = Maths.to_radians(angle)
            cos : Float64 = Math.cos(rad)
            sin : Float64 = Math.sin(rad)

            Vector2f.new(x * cos - y * sin, x * sin + y * cos)
        end

        def +(other : Vector2f) : Vector2f
            Vector2f.new(x + other.x, y + other.y)
        end

        def +(n : Float64) : Vector2f
            Vector2f.new(x + n, y + n)
        end

        def -(other : Vector2f) : Vector2f
            Vector2f.new(x - other.x, y - other.y)
        end

        def -(n : Float64) : Vector2f
            Vector2f.new(x - n, y - n)
        end

        def *(other : Vector2f) : Vector2f
            Vector2f.new(x * other.x, y * other.y)
        end

        def *(n : Float64) : Vector2f
            Vector2f.new(x * n, y * n)
        end

    end

end
