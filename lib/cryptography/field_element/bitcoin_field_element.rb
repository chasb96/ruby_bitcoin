require "./lib/cryptography/field_element/field_element"
require "./lib/cryptography/bitcoin_secp256k1_config"

class BitcoinFieldElement < FieldElement
    def initialize(number)
        super(number, BITCOIN_SECP256K1_CONFIG.P)
    end
end