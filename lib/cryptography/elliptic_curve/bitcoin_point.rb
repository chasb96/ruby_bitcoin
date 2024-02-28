require "./lib/cryptography/elliptic_curve/point"
require "./lib/cryptography/elliptic_curve/bitcoin_curve"
require "./lib/cryptography/bitcoin_secp256k1_config"
require "./lib/cryptography/elliptic_curve/curve.rb"

class BitcoinPoint < Point
    def initialize(x, y)
        super(x, y, BitcoinCurve.new())
    end

    def g
        return BitcoinS256Point(BITCOIN_SECP256K1_CONFIG.GX, BITCOIN_SECP256K1_CONFIG.GY)
    end
end