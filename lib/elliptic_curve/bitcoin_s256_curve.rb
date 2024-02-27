require "./lib/elliptic_curve/curve"
require "./lib/bitcoin_secp256k1_config"

class BitcoinS256Curve < Curve
    def initialize()
        a = S256FieldElement.new(BITCOIN_SECP256K1_CONFIG.A)
        b = S256FieldElement.new(BITCOIN_SECP256K1_CONFIG.B)

        super(a, b)
    end
end