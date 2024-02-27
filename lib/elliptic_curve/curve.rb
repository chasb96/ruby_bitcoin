class Curve
    def initialize(a, b)
        @a = a
        @b = b
    end

    def ==(other)
        return self.a == other.a && self.b == other.b
    end
end