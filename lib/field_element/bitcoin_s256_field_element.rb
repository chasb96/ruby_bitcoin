require "./lib/field_element/field_element"
require "./lib/bitcoin_secp256k1_config"

class BitcoinS256FieldElement < FieldElement
    def initialize(number)
        super(number, BITCOIN_SECP256K1_CONFIG.P)
    end
end