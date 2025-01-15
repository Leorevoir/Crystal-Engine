module Maths
    extend self

    def to_radians(angle : Float64) : Float64
        angle * Math::PI / 180.0f64
    end

end
