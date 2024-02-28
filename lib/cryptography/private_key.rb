class PrivateKey
    def initialize(secret, g, n)
        @secret = secret
        @g = g
        @n = n
        @point = g * secret
    end

    def sign(z)
        k = rand(self.n)

        r = self.g * k
        k_inv = k ** (self.n - 2) % self.n

        s = (z + r * self.secret) * k_inv % self.n

        if s > self.n / 2 
            s = self.n - s
        end

        Signature.new(r, s)
    end
end