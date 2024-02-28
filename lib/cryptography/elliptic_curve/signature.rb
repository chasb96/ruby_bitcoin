class Signature
    def initialize(r, s)
        @r = r
        @s = s
    end

    attr_reader :s
    attr_reader :r
end