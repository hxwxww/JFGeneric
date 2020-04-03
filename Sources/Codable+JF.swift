//
//  Codable+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/3.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation


// MARK: -  Encoder

public protocol AnyEncoder {
    
    func encode<T: Encodable>(_ value: T) throws -> Data
}

extension JSONEncoder: AnyEncoder {}
extension PropertyListEncoder: AnyEncoder {}

extension Encodable {
    
    public func encoded(using encoder: AnyEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

// MARK: -  Decoder

public protocol AnyDecoder {
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

extension JSONDecoder: AnyDecoder {}
extension PropertyListDecoder: AnyDecoder {}

extension Data {
    
    public func decoded<T: Decodable>(using decoder: AnyDecoder = JSONDecoder()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
}

// MARK: -  Decoding

extension KeyedDecodingContainerProtocol {
    
    public func decode<T: Decodable>(forKey key: Key, default defaultValue: @autoclosure () -> T) throws -> T {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue()
    }
    
    public func decode<T: Decodable>(forKey key: Key, default defaultValue: @autoclosure () -> T? = nil) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue()
    }
    
    public func decodeIfPacked<T: Decodable>(forKey key: Key, default defaultValue: @autoclosure () -> T) throws -> T where T: LosslessStringConvertible {
        do {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue()
        } catch DecodingError.typeMismatch {
            return try decode(StringPacked<T>.self, forKey: key).value
        } catch {
            throw error
        }
    }
    
    public func decodeIfPacked<T: Decodable>(forKey key: Key, default defaultValue: @autoclosure () -> T? = nil) throws -> T? where T: LosslessStringConvertible {
        do {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue()
        } catch DecodingError.typeMismatch {
            return try decode(StringPacked<T>.self, forKey: key).value
        } catch {
            throw error
        }
    }
}

public struct StringPacked<Value: LosslessStringConvertible>: Codable {
    
    let value: Value
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        guard let value = Value(string) else {
            throw DecodingError.dataCorruptedError( in: container, debugDescription: "Failed to convert an instance of \(Value.self) from \(string)")
        }
        
        self.value = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value.description)
    }
}
