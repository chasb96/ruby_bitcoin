require "../field_element/field_element.rb"

class Point
    def initialize(x, y, curve)
        if x != nil &&  y != nil 
            lhs = y ** 2
            rhs = curve.b + ((x ** 3) + curve.a * x)

            if lhs != rhs
                raise "Point (#{x}, #{y}) not on curve"
            end
        end

        @x = x
        @y = y
        @curve = curve
    end

    def self.identity(curve)
        return Point.new(nil, nil, curve)
    end

    def self.infinity(curve)
        return Point.identity(curve)
    end

    def is_identity()
        return self.x == nil && self.y == nil
    end

    def +(other)
        if self.curve != other.curve
            raise "Mismatching curves"
        end

        if self.is_identity || other.is_identity
            return Point.identity(self.curve)
        end

        if self == other 
            if p.y.number == 0 
                return Point.infinity(p.curve)
            end
        
            three = FieldElement.new(3, p.x.prime)
            two = FieldElement.new(2, p.x.prime)
        
            slope = (three * (p.x ** 2) + a) / (two * p.y)
        
            x2 = (slope ** 2) - (two * p.x)
            y2 = (slope * (p.x - x2)) - p.y
        
            return Point.new(x2, y2, p.curve)
        else
            x_diff = p2.x - p1.x
            y_diff = p2.y - p1.y

            slope = y_diff / x_diff

            x3 = ((slope ** 2) - p1.x) - p2.x
            y3 = (slope * (p1.x - x3)) - p1.y

            return Point.new(x3, y3, p1.curve)
        end
    end

    def *(scalar)
        result = Point.identity(self.curve)

        while scalar > 0
            if scalar & 1 == 1
                result = result + self
            end
            
            self = self + self

            scalar = scalar >> 1
        end

        return result
    end

    def ==(other)
        return self.x == other.x && self.y == other.y && self.curve == other.curve
    end
end