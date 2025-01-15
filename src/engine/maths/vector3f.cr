module Maths

    ####################################################################
    # Vector3f
    # of 3 float64
    struct Vector3f

        getter x : Float64
        getter y : Float64
        getter z : Float64
        protected setter x : Float64
        protected setter y : Float64
        protected setter z : Float64

        def initialize(@x : Float64, @y : Float64, @z : Float64)
        end

        def length : Float64
            Math.sqrt(x * x + y * y + z * z)
        end

        def dot(other : Vector3f) : Float64
            x * other.x + y * other.y + z * other.z
        end

        def cross(other : Vector3f) : Float64
            x_ = y * other.z - z * other.y
            y_ = z * other.x - x * other.z
            z_ = x * other.y - y * other.x

            Vector3f.new(x_, y_, z_)
        end

        def normalize : Vector3f
            vec_len : Float64 = length

            @x /= vec_len
            @y /= vec_len
            @z /= vec_len
            return self
        end

        #TODO: rotate 3D vector
        def rotate : Vector3f
            self
        end

        def +(other : Vector3f) : Vector3f
            Vector3f.new(x + other.x, y + other.y, z + other.z)
        end

        def +(n : Float64) : Vector3f
            Vector3f.new(x + n, y + n, z + n)
        end

        def -(other : Vector3f) : Vector3f
            Vector3f.new(x - other.x, y - other.y, z - other.z)
        end

        def -(n : Float64) : Vector3f
        Vector3f.new(x - n, y - n, z - n)
        end

        def *(other : Vector3f) : Vector3f
            Vector3f.new(x * other.x, y * other.y, z * other.z)
        end

        def *(n : Float64) : Vector3f
            Vector3f.new(x * n, y * n, z * n)
        end

    end

end
