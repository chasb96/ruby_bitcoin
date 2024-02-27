class FieldElement
    def initialize(number, prime)
        if number >= prime
            raise "Invalid number #{number}; number must be less than prime #{prime}"
        end

        @number = number
        @prime = prime
    end

    attr_reader :number
    attr_reader :prime

    def **(other)
        if self.prime != other.prime
            raise "Mismatch in primes #{self.prime} != #{other.prime}"
        end

        n = other.number % (self.prime - 1)
        number = (self.number ** n) % self.prime

        return FieldElement.new(number, self.prime)
    end

    def +(other)
        if self.prime != other.prime
            raise "Mismatch in primes #{self.prime} != #{other.prime}"
        end

        number = (self.number + other.number) % self.prime

        return FieldElement.new(number, self.prime)
    end

    def -(other)
        if self.prime != other.prime
            raise "Mismatch in primes #{self.prime} != #{other.prime}"
        end

        number = 0

        if self.number < other.number
            number = self.prime - ((other.number - self.number) % self.prime)
        elsif other.number < self.number
            number = (self.number - other.number) % self.prime
        end

        return FieldElement.new(number, self.prime)
    end

    def *(other)
        if self.prime != other.prime
            raise "Mismatch in primes #{self.prime} != #{other.prime}"
        end

        number = (self.number * other.number) % self.prime

        return FieldElement.new(number, self.prime)
    end

    def /(other)
        if self.prime != other.prime
            raise "Mismatch in primes #{self.prime} != #{other.prime}"
        end

        modpow = (other.number ** (self.prime - 2)) % self.prime
        number = ((self.number % self.prime) * modpow) % self.prime

        return FieldElement.new(number, self.prime)
    end

    def ==(other)
        return self.number == other.number && self.prime == other.prime
end