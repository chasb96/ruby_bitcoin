require "./lib/cryptography/private_key"

class BitcoinPrivateKey < PrivateKey
    def initialize(secret)
        super(secret, BitcoinPoint.g, BITCOIN_SECP256K1_CONFIG.N)
    end
end