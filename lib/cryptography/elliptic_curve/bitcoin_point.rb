require "./lib/cryptography/elliptic_curve/point"
require "./lib/cryptography/elliptic_curve/bitcoin_curve"
require "./lib/cryptography/elliptic_curve/curve.rb"
require "./lib/cryptography/field_element/bitcoin_field_element.rb"
require "./lib/cryptography/bitcoin_secp256k1_config"
require "./lib/serialization/sec/serialize.rb"
require "./lib/serialization/sec/deserialize.rb"\

class BitcoinPoint < Point
    include SerializeSEC
    include DeserializeSEC

    def initialize(x, y)
        super(x, y, BitcoinCurve.new())
    end

    def g
        return BitcoinS256Point(BITCOIN_SECP256K1_CONFIG.GX, BITCOIN_SECP256K1_CONFIG.GY)
    end

    def serialize_sec(compress)
        if !compressed
            x = self.x.to_s(16)
            y = self.y.to_s(16)

            return "\x04#{x}#{y}"
        elsif self.y % 2 == 0
            x = self.x.to_s(16)

            return "\x03#{x}"
        else
            x = self.x.to_s(16)

            return "\x02#{x}"
        end
    end

    def deserialize_sec(content_bytes)
        if content_bytes[0] == 4
            x = BitcoinFieldElement.new(bytes_to_int(content_bytes[1..33]))
            y = BitcoinFieldElement.new(bytes_to_int(content_bytes[33..65]))

            return BitcoinPoint.new(x, y)
        elsif content_bytes[0] == 3
            x = BitcoinFieldElement.new(bytes_to_int(content_bytes[1..]))

            alpha = x ** 3  + BITCOIN_SECP256K1_CONFIG.B
            beta = alpha.sqrt
            
            if beta.number % 2 == 0
                return BitcoinPoint.new(x, beta)
            elsif
                beta_inv = beta.number - BITCOIN_SECP256K1_CONFIG.P

                return BitcoinPoint.new(x, beta_inv)
            end
        elsif content_bytes[0] == 2
            x = BitcoinFieldElement.new(bytes_to_int(content_bytes[1..]))

            alpha = x ** 3  + BITCOIN_SECP256K1_CONFIG.B
            beta = alpha.sqrt
            
            if beta.number % 2 == 1
                return BitcoinPoint.new(x, beta)
            elsif
                beta_inv = beta.number - BITCOIN_SECP256K1_CONFIG.P

                return BitcoinPoint.new(x, beta_inv)
            end
        else
            raise "Invalid format"
        end
    end
end