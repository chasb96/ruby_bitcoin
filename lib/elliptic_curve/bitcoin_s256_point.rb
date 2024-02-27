require "./lib/elliptic_curve/point"
require "./lib/elliptic_curve/bitcoin_s256_curve"
require "./lib/bitcoin_secp256k1_config"
require "./lib/elliptic_curve/curve.rb"

class BitcoinS256Point < Point
    def initialize(x, y)
        super(x, y, BitcoinS256Curve.new())
    end
end