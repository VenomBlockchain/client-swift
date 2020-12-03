//
//  File.swift
//
//
//  Created by Oleh Hudeichuk on 20.10.2020.
//

import Foundation

//SigningBoxHandle
public typealias TSDKSigningBoxHandle = Int
///Int

//ParamsOfFactorize
public struct TSDKParamsOfFactorize: Codable {
    public var composite: String

    public init(composite: String) {
        self.composite = composite
    }
}
///composite: String – Hexadecimal representation of u64 composite Int.

//ResultOfFactorize
public struct TSDKResultOfFactorize: Codable {
    public var factors: [String]
}
///factors: String[] – Two factors of composite or empty if composite can't be factorized.

//ParamsOfModularPower
public struct TSDKParamsOfModularPower: Codable {
    public var base: String
    public var exponent: String
    public var modulus: String

    public init(base: String, exponent: String, modulus: String) {
        self.base = base
        self.exponent = exponent
        self.modulus = modulus
    }
}
///base: String – base argument of calculation.
///exponent: String – exponent argument of calculation.
///modulus: String – modulus argument of calculation.

//ResultOfModularPower
public struct TSDKResultOfModularPower: Codable {
    public var modular_power: String
}
///modular_power: String – result of modular exponentiation

//ParamsOfTonCrc16
public struct TSDKParamsOfTonCrc16: Codable {
    public var data: String

    public init(data: String) {
        self.data = data
    }
}
///data: String – Input data for CRC calculation. Encoded with base64.

//ResultOfTonCrc16
public struct TSDKResultOfTonCrc16: Codable {
    public var crc: Int
}
///crc: Int – Calculated CRC for input data.

//ParamsOfGenerateRandomBytes
public struct TSDKParamsOfGenerateRandomBytes: Codable {
    public init(length: Int) {
        self.length = length
    }

    public var length: Int
}
///length: Int – Size of random byte array.

//ResultOfGenerateRandomBytes
public struct TSDKResultOfGenerateRandomBytes: Codable {
    public var bytes: String
}
///bytes: String – Generated bytes encoded with base64.

//ParamsOfConvertPublicKeyToTonSafeFormat
public struct TSDKParamsOfConvertPublicKeyToTonSafeFormat: Codable {
    public init(public_key: String) {
        self.public_key = public_key
    }

    public var public_key: String
}
///public_key: String – Public key.

//ResultOfConvertPublicKeyToTonSafeFormat
public struct TSDKResultOfConvertPublicKeyToTonSafeFormat: Codable {
    public var ton_public_key: String
}
///ton_public_key: String – Public key represented in TON safe format.

//KeyPair
public struct TSDKKeyPair: Codable {

    public var `public`: String
    public var secret: String

    public init(public: String, secret: String) {
        self.public = `public`
        self.secret = secret
    }
}
///public: String – Public key. Encoded with hex.
///secret: String – Private key. Encoded with hex.

//ParamsOfSign
public struct TSDKParamsOfSign: Codable {
    public var unsigned: String
    public var keys: TSDKKeyPair
    
    public init(unsigned: String, keys: TSDKKeyPair) {
        self.unsigned = unsigned.base64Encoded() ?? ""
        self.keys = keys
    }

    public init(unsignedEncodedBase64: String, keys: TSDKKeyPair) {
        self.unsigned = unsignedEncodedBase64
        self.keys = keys
    }
}
///unsigned: String – Data that must be signed.
////keys: KeyPair – Sign keys.

//ResultOfSign
public struct TSDKResultOfSign: Codable {
    public var signed: String
    public var signature: String
    
    public init(signed: String, signature: String) {
        self.signed = signed.base64Encoded() ?? ""
        self.signature = signature
    }

    public init(signedEncodedBase64: String, signature: String) {
        self.signed = signedEncodedBase64
        self.signature = signature
    }
}
////signed: String – Signed data combined with signature. Encoded with base64.
///signature: String – Signature. Encoded with base64.

//ParamsOfVerifySignature
public struct TSDKParamsOfVerifySignature: Codable {
    public init(signed: String, public: String) {
        self.signed = signed
        self.public = `public`
    }

    public var signed: String
    public var `public`: String
}
///signed: String – Signed data that must be verified.
///public: String – Signer's public key.

//ResultOfVerifySignature
public struct TSDKResultOfVerifySignature: Codable {
    public var unsigned: String
}
///unsigned: String – Unsigned data.

//ParamsOfHash
public struct TSDKParamsOfHash: Codable {
    public var data: String
    
    public init(data: String) {
        self.data = data.base64Encoded() ?? ""
    }

    public init(dataEncodedBase64: String) {
        self.data = dataEncodedBase64
    }
}
///data: String – Input data for hash calculation. Encoded with base64.

//ResultOfHash
public struct TSDKResultOfHash: Codable {
    public var hash: String
}
///hash: String – Hex-encoded hash of input data.

//ParamsOfScrypt
public struct TSDKParamsOfScrypt: Codable {
    public var password: String
    public var salt: String
    public var log_n: Int
    public var r: Int
    public var p: Int
    public var dk_len: Int
    
    public init(password: String, salt: String, log_n: Int, r: Int, p: Int, dk_len: Int) {
        self.password = password.base64Encoded() ?? ""
        self.salt = salt.base64Encoded() ?? ""
        self.log_n = log_n
        self.r = r
        self.p = p
        self.dk_len = dk_len
    }

    public init(passwordEncodedBase64: String, saltEncodedBase64: String, log_n: Int, r: Int, p: Int, dk_len: Int) {
        self.password = passwordEncodedBase64
        self.salt = saltEncodedBase64
        self.log_n = log_n
        self.r = r
        self.p = p
        self.dk_len = dk_len
    }
}
///password: String – The password bytes to be hashed.
///salt: string – Salt bytes that modify the hash to protect against Rainbow table attacks. Must be encoded with base64.
///log_n: Int – CPU/memory cost parameter
///r: Int – The block size parameter which fine-tunes sequential memory read size and performance.
///p: Int – Parallelization parameter.
///dk_len: Int – Intended output length in octets of the derived key.

//ResultOfScrypt
public struct TSDKResultOfScrypt: Codable {
    public var key: String
}
///key: String – Derived key. Encoded with hex.

//ParamsOfNaclSignKeyPairFromSecret
public struct TSDKParamsOfNaclSignKeyPairFromSecret: Codable {
    public init(secret: String) {
        self.secret = secret
    }

    public var secret: String
}
///secret: String – secret key

//ParamsOfNaclSign
public struct TSDKParamsOfNaclSign: Codable {
    public var unsigned: String
    public var secret: String
    
    public init(unsigned: String, secret: String) {
        self.unsigned = unsigned.base64Encoded() ?? ""
        self.secret = secret
    }

    public init(unsignedEncodedBase64: String, secret: String) {
        self.unsigned = unsignedEncodedBase64
        self.secret = secret
    }
}
///unsigned: String – Data that must be signed. Encoded with base64.
///secret: String – Signer's secret key.

//ResultOfNaclSign
public struct TSDKResultOfNaclSign: Codable {
    public var signed: String
}
///signed: String – Signed data encoded with base64.

//ParamsOfNaclSignOpen
public struct TSDKParamsOfNaclSignOpen: Codable {
    public var signed: String
    public var `public`: String
    
    public init(signed: String, public: String) {
        self.signed = signed.base64Encoded() ?? ""
        self.public = `public`
    }

    public init(signedEncodedBase64: String, public: String) {
        self.signed = signedEncodedBase64
        self.public = `public`
    }
}
///signed: String – Signed data that must be unsigned. Encoded with base64.
///public: String – Signer's public key.

//ResultOfNaclSignOpen
public struct TSDKResultOfNaclSignOpen: Codable {
    public var unsigned: String
    
    public init(unsigned: String) {
        self.unsigned = unsigned.base64Encoded() ?? ""
    }

    public init(unsignedEncodedBase64: String) {
        self.unsigned = unsignedEncodedBase64
    }
}
///unsigned: String – Unsigned data encoded with base64.

//ResultOfNaclSignDetached
public struct TSDKResultOfNaclSignDetached: Codable {
    public var signature: String
}
///signature: String – Hex encoded sign.

//ParamsOfNaclBoxKeyPairFromSecret
public struct TSDKParamsOfNaclBoxKeyPairFromSecret: Codable {
    public init(secret: String) {
        self.secret = secret
    }

    public var secret: String
}
///secret: String – Hex encoded secret key.

//ParamsOfNaclBox
public struct TSDKParamsOfNaclBox: Codable {
    public var decrypted: String
    public var nonce: String
    public var their_public: String
    public var secret: String
    
    public init(decrypted: String, nonce: String, their_public: String, secret: String) {
        self.decrypted = decrypted.base64Encoded() ?? ""
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }

    public init(decryptedEncodedBase64: String, nonce: String, their_public: String, secret: String) {
        self.decrypted = decryptedEncodedBase64
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }
}
///decrypted: String – Data that must be encrypted. Encoded with base64.
///nonce: String
///their_public: String
///secret: String

//ResultOfNaclBox
public struct TSDKResultOfNaclBox: Codable {
    public var encrypted: String
    
    public init(encrypted: String) {
        self.encrypted = encrypted.base64Encoded() ?? ""
    }

    public init(encryptedEncodedBase64: String) {
        self.encrypted = encryptedEncodedBase64
    }
}
///encrypted: String – Encrypted data. Encoded with base64.

//ParamsOfNaclBoxOpen
public struct TSDKParamsOfNaclBoxOpen: Codable {
    public var encrypted: String
    public var nonce: String
    public var their_public: String
    public var secret: String
    
    public init(encrypted: String, nonce: String, their_public: String, secret: String) {
        self.encrypted = encrypted.base64Encoded() ?? ""
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }

    public init(encryptedEncodedBase64: String, nonce: String, their_public: String, secret: String) {
        self.encrypted = encryptedEncodedBase64
        self.nonce = nonce
        self.their_public = their_public
        self.secret = secret
    }
}
///encrypted: String – Data that must be decrypted. Encoded with base64.
///nonce: String
///their_public: String
///secret: String

//ResultOfNaclBoxOpen
public struct TSDKResultOfNaclBoxOpen: Codable {
    public var decrypted: String
    
    public init(decrypted: String) {
        self.decrypted = decrypted.base64Encoded() ?? ""
    }

    public init(decryptedEncodedBase64: String) {
        self.decrypted = decryptedEncodedBase64
    }
}
///decrypted: String – Decrypted data. Encoded with base64.

//ParamsOfNaclSecretBox
public struct TSDKParamsOfNaclSecretBox: Codable {
    public var decrypted: String
    public var nonce: String
    public var key: String
    
    public init(decrypted: String, nonce: String, key: String) {
        self.decrypted = decrypted.base64Encoded() ?? ""
        self.nonce = nonce
        self.key = key
    }

    public init(decryptedEncodedBase64: String, nonce: String, key: String) {
        self.decrypted = decryptedEncodedBase64
        self.nonce = nonce
        self.key = key
    }
}
///decrypted: String – Data that must be encrypted. Encoded with base64.
///nonce: String
///key: String

//ParamsOfNaclSecretBoxOpen
public struct TSDKParamsOfNaclSecretBoxOpen: Codable {
    public var encrypted: String
    public var nonce: String
    public var key: String
    
    public init(encrypted: String, nonce: String, key: String) {
        self.encrypted = encrypted.base64Encoded() ?? ""
        self.nonce = nonce
        self.key = key
    }

    public init(encryptedEncodedBase64: String, nonce: String, key: String) {
        self.encrypted = encryptedEncodedBase64
        self.nonce = nonce
        self.key = key
    }
}
///encrypted: String – Data that must be decrypted. Encoded with base64.
///nonce: String
///key: String

//ParamsOfMnemonicWords
public struct TSDKParamsOfMnemonicWords: Codable {
    public init(dictionary: TSDKMnemonicDictionary? = nil) {
        self.dictionary = dictionary
    }

    public var dictionary: TSDKMnemonicDictionary?
}
///dictionary?: Int – dictionary identifier

//ResultOfMnemonicWords
public struct TSDKResultOfMnemonicWords: Codable {
    public var words: String
}
///words: String – the list of mnemonic words

//ParamsOfMnemonicFromRandom
public struct TSDKParamsOfMnemonicFromRandom: Codable {
    public init(dictionary: TSDKMnemonicDictionary? = nil, word_count: Int? = nil) {
        self.dictionary = dictionary
        self.word_count = word_count
    }

    public var dictionary: TSDKMnemonicDictionary?
    public var word_count: Int?
}
///dictionary?: Int – dictionary identifier
///word_count?: Int – mnemonic word count

//ResultOfMnemonicFromRandom
public struct TSDKResultOfMnemonicFromRandom: Codable {
    public var phrase: String
}
///phrase: String – String of mnemonic words

//ParamsOfMnemonicFromEntropy
public struct TSDKParamsOfMnemonicFromEntropy: Codable {
    public init(entropy: String, dictionary: TSDKMnemonicDictionary? = nil, word_count: Int? = nil) {
        self.entropy = entropy
        self.dictionary = dictionary
        self.word_count = word_count
    }

    public var entropy: String
    public var dictionary: TSDKMnemonicDictionary?
    public var word_count: Int?
}
///entropy: String
///dictionary?: Int
///word_count?: Int

//ResultOfMnemonicFromEntropy
public struct TSDKResultOfMnemonicFromEntropy: Codable {
    public var phrase: String
}
///phrase: String

//ParamsOfMnemonicVerify
public struct TSDKParamsOfMnemonicVerify: Codable {
    public init(phrase: String, dictionary: TSDKMnemonicDictionary? = nil, word_count: Int? = nil) {
        self.phrase = phrase
        self.dictionary = dictionary
        self.word_count = word_count
    }

    public var phrase: String
    public var dictionary: TSDKMnemonicDictionary?
    public var word_count: Int?
}
///phrase: String – phrase
///dictionary?: Int – dictionary identifier
///word_count?: Int – word count

//ResultOfMnemonicVerify
public struct TSDKResultOfMnemonicVerify: Codable {
    public var valid: Bool
}
///valid: boolean – flag indicating if the mnemonic is valid or not

//ParamsOfMnemonicDeriveSignKeys
public struct TSDKParamsOfMnemonicDeriveSignKeys: Codable {
    public init(phrase: String, path: String? = nil, dictionary: TSDKMnemonicDictionary? = nil, word_count: Int? = nil) {
        self.phrase = phrase
        self.path = path
        self.dictionary = dictionary
        self.word_count = word_count
    }

    public var phrase: String
    public var path: String?
    public var dictionary: TSDKMnemonicDictionary?
    public var word_count: Int?
}
///phrase: String – phrase
///path?: String – derivation path for instance "m/44'/396'/0'/0/0"
///dictionary?: Int – dictionary identifier
///word_count?: Int – word count

//ParamsOfHDKeyXPrvFromMnemonic
public struct TSDKParamsOfHDKeyXPrvFromMnemonic: Codable {
    public init(phrase: String, dictionary: Int? = nil, word_count: Int? = nil) {
        self.phrase = phrase
        self.dictionary = dictionary
        self.word_count = word_count
    }

    public var phrase: String
    public var dictionary: Int?
    public var word_count:  Int?
}
///phrase: String – String with seed phrase
///dictionary?: number – Dictionary identifier
///word_count?: number – Mnemonic word count

//ResultOfHDKeyXPrvFromMnemonic
public struct TSDKResultOfHDKeyXPrvFromMnemonic: Codable {
    public var xprv: String
}
///xprv: String – serialized extended master private key

//ParamsOfHDKeyDeriveFromXPrv
public struct TSDKParamsOfHDKeyDeriveFromXPrv: Codable {
    public init(xprv: String, child_index: Int, hardened: Bool) {
        self.xprv = xprv
        self.child_index = child_index
        self.hardened = hardened
    }

    public var xprv: String
    public var child_index: Int
    public var hardened: Bool
}
///xprv: String – serialized extended private key
///child_index: Int – child index (see BIP-0032)
///hardened: boolean – indicates the derivation of hardened/not-hardened key (see BIP-0032)

//ResultOfHDKeyDeriveFromXPrv
public struct TSDKResultOfHDKeyDeriveFromXPrv: Codable {
    public var xprv: String
}
///xprv: String – serialized extended private key

//ParamsOfHDKeyDeriveFromXPrvPath
public struct TSDKParamsOfHDKeyDeriveFromXPrvPath: Codable {
    public init(xprv: String, path: String) {
        self.xprv = xprv
        self.path = path
    }

    public var xprv: String
    public var path: String
}
///xprv: String – serialized extended private key
///path: String – derivation path for instance "m/44'/396'/0'/0/0"

//ResultOfHDKeyDeriveFromXPrvPath
public struct TSDKResultOfHDKeyDeriveFromXPrvPath: Codable {
    public var xprv: String
}
///xprv: String – derived serialized extended private key

//ParamsOfHDKeySecretFromXPrv
public struct TSDKParamsOfHDKeySecretFromXPrv: Codable {
    public init(xprv: String) {
        self.xprv = xprv
    }

    public var xprv: String
}
///xprv: String – serialized extended private key

//ResultOfHDKeySecretFromXPrv
public struct TSDKResultOfHDKeySecretFromXPrv: Codable {
    public var secret: String
}
///secret: String – private key

//ParamsOfHDKeyPublicFromXPrv
public struct TSDKParamsOfHDKeyPublicFromXPrv: Codable {
    public init(xprv: String) {
        self.xprv = xprv
    }

    public var xprv: String
}
///xprv: String – serialized extended private key

//ResultOfHDKeyPublicFromXPrv
public struct TSDKResultOfHDKeyPublicFromXPrv: Codable {
    public var `public`: String
}

public enum TSDKMnemonicDictionary: Int, Codable {
    case TON = 0
    case ENGLISH = 1
    case CHINESE_SIMPLIFIED = 2
    case CHINESE_TRADITIONAL = 3
    case FRENCH = 4
    case ITALIAN = 5
    case JAPANESE = 6
    case KOREAN = 7
    case SPANISH = 8
}

//ParamsOfChaCha20
public struct TSDKParamsOfChaCha20: Encodable {

    public var data: String
    public var key: String
    public var nonce: String

    public init(data: String, key: String, nonce: String) {
        self.data = data.base64Encoded() ?? ""
        self.key = key
        self.nonce = nonce
    }

    public init(dataEncodedBase64: String, key: String, nonce: String) {
        self.data = dataEncodedBase64
        self.key = key
        self.nonce = nonce
    }
}
///data: string – Source data to be encrypted or decrypted. Must be encoded with base64.
///key: string – 256-bit key. Must be encoded with hex.
///nonce: string – 96-bit nonce. Must be encoded with hex.

//ResultOfChaCha20
public struct TSDKResultOfChaCha20: Codable {
    public var data: String

    public init(data: String) {
        self.data = data.base64Encoded() ?? ""
    }

    public init(dataEncodedBase64: String) {
        self.data = dataEncodedBase64
    }
}
///data: string – Encrypted/decrypted data. Encoded with base64.
