//
//  String+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation

// MARK: - 字符串简单操作

extension String {
    
    /// 截取字符串
    ///
    /// - Parameters:
    ///   - index: 截取的字符串起始位置
    ///   - length: 截取的字符串长度
    /// - Returns: 截取的字符串
    public func substring(at index: Int, length: Int) -> String {
        guard index >= 0 && index < count && length >= 0 else {
            print("Substring Fail: index out of bounds")
            return ""
        }
        let start = self.index(startIndex, offsetBy: index)
        var end: String.Index
        if index + length <= count {
            end = self.index(start, offsetBy: length)
        } else {
            end = self.endIndex
        }
        return String(self[start ..< end])
    }
    
    /// 截取字符串，从指定位置到末尾
    ///
    /// - Parameter index: 截取的字符串起始位置
    /// - Returns: 截取的字符串
    public func substring(from index: Int) -> String {
        return substring(at: index, length: count - index)
    }
    
    /// 截取字符串，从开头到指定位置
    ///
    /// - Parameter index: 截取的字符串结束位置
    /// - Returns: 截取的字符串
    public func substring(to index: Int) -> String {
        return substring(at: 0, length: index)
    }
    
    /// 去除左右的空格和换行符的字符串
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

// MARK: - 编解码
extension String {
    
    /// 编码之后的url
    public var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    /// 解码之后的url
    public var urlDecoded: String? {
        return removingPercentEncoding
    }
    
    /// base64编码之后的字符串
    public var base64Encoded: String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    /// base64解码之后的字符串
    public var base64Decoded: String? {
        guard let base64Data = Data(base64Encoded: self) else { return nil }
        return String(data: base64Data, encoding: .utf8)
    }

}
