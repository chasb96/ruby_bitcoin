class Signature
    def initialize(r, s)
        @r = r
        @s = s
    end

    attr_reader :r
    attr_reader :s
end