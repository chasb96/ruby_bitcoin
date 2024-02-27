require "bitcoin_secp256k1_config.rb"

class S256FieldElement < FieldElement
    def initialize(number)
        super(number, BITCOIN_SECP256K1_CONFIG::P)
    end
end