//
//  Array+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation

// MARK:  - 数组简单操作

extension Array {
    
    /// 安全获取元素
    public func element(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    ///  替换元素
    ///
    /// - Parameters:
    ///   - index: 替换的下标
    ///   - element: 要替换的元素
    public mutating func replaceElement(_ element: Element, at index: Int) {
        guard index >= 0 && index < count else { return }
        self[index] = element
    }
    
    /// 随机获取多个元素
    ///
    /// - Parameters:
    ///   - size: 元素个数
    ///   - shouldRepeat: 取出的元素是否可以重复，默认不可以
    /// - Returns: 取出的元素数组
    public func randomElements(size: Int, shouldRepeat: Bool = false) -> [Element]? {
        guard count > 0 else { return nil }
        var randomElements: [Element] = []
        if shouldRepeat {
            // 元素可以重复的情况
            for _ in 0 ..< size {
                if let randomElement = randomElement() {
                    randomElements.append(randomElement)
                }
            }
        } else {
            // 元素不可以重复的情况
            var copyElements = self
            for _ in 0 ..< size {
                // 如果copyElements的元素取光了
                if copyElements.isEmpty {
                    break
                }
                let randomIndex = Int(arc4random_uniform(UInt32(copyElements.count)))
                randomElements.append(copyElements[randomIndex])
                copyElements.remove(at: randomIndex)
            }
        }
        return randomElements
    }
    
    /// 打乱顺序
    public mutating func shuffle() {
        for _ in 0 ..< count {
            sort { _,_ in arc4random() < arc4random() }
        }
    }
    
    /// 打乱顺序后的数组
    public var shuffled: [Element] {
        var newArr = self
        newArr.shuffle()
        return newArr
    }

}

// MARK: -  subscript

extension Array {

    /// 多个索引get、set
    ///
    ///      var nums = [10, 20, 30, 40, 50]
    ///      print(nums[1, 4, 2]) -> Prints "[20, 50, 30]"
    ///      nums[1, 4] = [80, 90]
    ///      print(nums) -> Prints "[10, 80, 30, 40, 90]"
    ///
    public subscript(idx1: Int, idx2: Int, rest: Int...) -> [Element] {
        get {
            var result: [Element] = [self[idx1], self[idx2]]
            for index in rest {
                result.append(self[index])
            }
            return result
        }
        set (values) {
            for (index, value) in zip([idx1, idx2] + rest, values) {
                self[index] = value
            }
        }
    }
    
    /// 安全获取索引值
    public subscript(safe idx: Int) -> Element? {
        get {
            return element(at: idx)
        }
        set {
            if let value = newValue {
                replaceElement(value, at: idx)
            }
        }
    }
    
}

// MARK: -  Equatable

extension Array where Element: Equatable {
    
    /// 去重
    public var unique: [Element] {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
    
    /// 删除单个元素
    public mutating func removeElement(_ element: Element) {
        removeElements([element])
    }
    
    /// 删除多个元素
    public mutating func removeElements(_ elements: [Element]) {
        for element in elements {
            if let index = firstIndex(of: element) {
                remove(at: index)
            }
        }
    }
    
}
