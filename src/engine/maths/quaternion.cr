module Maths

    struct Quaternion

        property x, y, z, w

        def initialize(@x : Float64, @y : Float64, @z : Float64, @w : Float64)
        end

        def length : Float64
            Math.sqrt(x * x + y * y + z * z + w * w)
        end

        def normalize : Quaternion
            q_len = length

            @x /= q_len
            @y /= q_len
            @z /= q_len
            @w /= q_len
            self
        end

        def conjugate : Quaternion
            Quaternion.new(-x, -y, -z, w)
        end

        def *(q : Quaternion)
            x_ : Float64 = w * q.w - x * q.x - y * q.y - z * q.z
            y_ : Float64 = x * q.w + w * q.x + y * q.z - z * q.y
            z_ : Float64 = y * q.w + w * q.y + z * q.x - x * q.z
            w_ : Float64 = z * q.w + w * q.z + x * q.y - y * q.x

            Quaternion.new(x_, y_, z_, w_)
        end

        def *(v : Vector3f)
            x_ : Float64 = -x * v.x - y * v.y - z * v.z
            y_ : Float64 = w * v.x + y * v.z - z * v.y
            z_ : Float64 = w * v.y + z * v.x - x * v.z
            w_ : Float64 = w * v.z + x * v.y - y * v.x

            Quaternion.new(x_, y_, z_, w_)
        end
    end

end
