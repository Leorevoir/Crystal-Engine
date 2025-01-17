module Maths

    extend self

    def to_radians(angle : Float32) : Float32
        angle * Math::PI / 180.0_f32
    end

end
