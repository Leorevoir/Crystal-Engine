module Maths

    ####################################################################
    # Vector3f
    # of 3 float64
    struct Vector3f

        getter x : Float32
        getter y : Float32
        getter z : Float32
        protected setter x : Float32
        protected setter y : Float32
        protected setter z : Float32

        def initialize(@x : Float32, @y : Float32, @z : Float32)
        end

        def length : Float32
            Math.sqrt(@x ^ 2 + @y ^ 2 + @z ^ 2)
        end

        def dot(other : Vector3f) : Float32
            x * other.x + y * other.y + z * other.z
        end

        def cross(other : Vector3f) : Float32
            x_ = y * other.z - z * other.y
            y_ = z * other.x - x * other.z
            z_ = x * other.y - y * other.x

            Vector3f.new(x_, y_, z_)
        end

        def normalize : Vector3f
            vec_len : Float32 = length

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

        def +(n : Float32) : Vector3f
            Vector3f.new(x + n, y + n, z + n)
        end

        def -(other : Vector3f) : Vector3f
            Vector3f.new(x - other.x, y - other.y, z - other.z)
        end

        def -(n : Float32) : Vector3f
        Vector3f.new(x - n, y - n, z - n)
        end

        def *(other : Vector3f) : Vector3f
            Vector3f.new(x * other.x, y * other.y, z * other.z)
        end

        def *(n : Float32) : Vector3f
            Vector3f.new(x * n, y * n, z * n)
        end

    end

end
