module Maths

    ####################################################################
    # Vector2f
    # of 2 float64
    struct Vector2f

        getter x : Float32
        getter y : Float32
        protected setter x : Float32
        protected setter y : Float32

        def initialize(@x : Float32, @y : Float32)
        end

        def length : Float32
            Math.sqrt(x * x + y * y)
        end

        def dot(other : Vector2f) : Float32
            x * other.x + y * other.y
        end

        def normalize : Vector2f
            vec_len : Float32 = length

            @x /= vec_len
            @y /= vec_len
            return self
        end

        def rotate(angle : Float32) : Vector2f
            rad : Float32 = Maths.to_radians(angle)
            cos : Float32 = Math.cos(rad)
            sin : Float32 = Math.sin(rad)

            Vector2f.new(x * cos - y * sin, x * sin + y * cos)
        end

        def +(other : Vector2f) : Vector2f
            Vector2f.new(x + other.x, y + other.y)
        end

        def +(n : Float32) : Vector2f
            Vector2f.new(x + n, y + n)
        end

        def -(other : Vector2f) : Vector2f
            Vector2f.new(x - other.x, y - other.y)
        end

        def -(n : Float32) : Vector2f
            Vector2f.new(x - n, y - n)
        end

        def *(other : Vector2f) : Vector2f
            Vector2f.new(x * other.x, y * other.y)
        end

        def *(n : Float32) : Vector2f
            Vector2f.new(x * n, y * n)
        end

    end

end
