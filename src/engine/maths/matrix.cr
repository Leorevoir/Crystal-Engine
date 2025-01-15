module Maths

    ####################################################################
    # Matrix4f
    struct Matrix4f

        alias Matrix = Array(Array(Float64))
        alias V2     = Array(Float64)

        @m : Matrix

        def initialize
            @m = Matrix.new(4) { V2.new(4, 0.0) }
        end

        # make a identity 4x4 matrix
        def init_identity : Matrix4f
            (0..3).each { |i| (0..3).each { |j| @m[i][j] = (i == j) ? 1.0 : 0.0 } }
            self
        end

        def *(r : Matrix4f) : Matrix4f
            result = Matrix4f.new

            (0..3).each { |i| (0..3).each { |j|
                result.set(i, j,
                    @m[i][0] * r.get(0, j) +
                    @m[i][1] * r.get(1, j) +
                    @m[i][2] * r.get(2, j) +
                    @m[i][3] * r.get(3, j)
                )
            }}
            result
        end

        #TODO: maybe smaller indexes like u16 or even u8?
        def get(x : Int32, y : Int32)
            @m[x][y]
        end

        def set(m : Matrix)
            @m = m
        end

        def set(x : Int32, y : Int32, value : Float64)
            @m[x][y] = value
        end

        def ==(other : Matrix4f) : Bool
            (0..3).all? { |i| (0..3).all? { |j| @m[i][j] == other.get(i, j) } }
        end

        def to_s : String
            @m.map { |row| row.map { |v| v.to_s.ljust(6) }.join(" ") }.join("\n")
        end

    end

end
