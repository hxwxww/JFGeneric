//
//  Timer+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/8.
//  Copyright © 2020 WHX. All rights reserved.
//

import Foundation

extension Timer {
    
    /// 定时模式
    public enum Mode {
        case infinite
        case finite(_ count: Int)
        case once
        
        public var isRepeating: Bool {
            switch self {
            case .once:
                return false
            case .finite(let count) where count == 1:
                return false
            default:
                return true
            }
        }
        
        public var repeatCount: Int? {
            switch self {
            case .finite(let count):
                return count
            case .once:
                return 1
            case .infinite:
                return nil
            }
        }
    }
}

extension Timer {
    
    /// 间隔
    public enum Interval {
        case milliseconds(_ value: Double)
        case seconds(_ value: Double)
        case minutes(_ value: Double)
        case hours(_ value: Double)
        case days(_ value: Double)
        
        var value: TimeInterval {
            switch self {
            case .milliseconds(let value):
                return value / 1000
            case .seconds(let value):
                return value
            case .minutes(let value):
                return value * 60
            case .hours(let value):
                return value * 3600
            case .days(let value):
                return value * 86400
            }
        }
    }
}

extension Timer {
    
    private struct AssociatedKeys {
        static var remainingCount = "remainingCount"
        static var interval = "interval"
    }
    
    private var remainingCount: Int? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.remainingCount, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.remainingCount) as? Int
        }
    }
    
    private var interval: TimeInterval {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.interval, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.interval) as? TimeInterval ?? 0
        }
    }
    
    private func calculateRemainingCount() {
        if remainingCount != nil {
            remainingCount! -= 1
            /// 结束
            if remainingCount! <= 0 {
                invalidate()
            }
        }
    }
}

extension Timer {
    
    public typealias Handler = (Timer) -> Void

    
    /// 创建一个Timer实例，需要手动调用 `start()`
    ///
    /// - Parameters:
    ///   - interval: 间隔
    ///   - mode: 重复模式，默认`.infinite`
    ///   - handler: 回调
    /// - Returns: Timer实例
    public class func new(interval: Interval, mode: Mode = .infinite, handler: @escaping Handler) -> Timer {
        let intervalValue = mode.isRepeating ? interval.value : 0
        
        var timer: Timer
        timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval.value, intervalValue, 0, 0) { aTimer in
            guard let aTimer = aTimer else { return }
            let t = aTimer as Timer
            handler(t)
            t.calculateRemainingCount()
        }
        
        timer.remainingCount = mode.repeatCount
        timer.interval = interval.value
        return timer
    }
    
    /// 创建一个只执行一次的定时器并执行
    ///
    /// - Parameters:
    ///   - interval: 间隔
    ///   - handler: 回调
    /// - Returns: Timer实例
    public class func once(_ interval: Interval, handler : @escaping Handler) -> Timer {
        let timer = Timer.new(interval: interval, mode: .once, handler: handler)
        timer.start()
        return timer
    }
    
    /// 创建一个多次执行的定时器并执行
    ///
    /// - Parameters:
    ///   - interval: 间隔
    ///   - count: 重复次数，为nil则为无限次数，默认`nil`
    ///   - handler: 回调
    /// - Returns: Timer实例
    public class func every(_ interval: Interval, count: Int? = nil, handler : @escaping Handler) -> Timer {
        let mode: Mode = count != nil ? .finite(count!) : .infinite
        
        let timer = Timer.new(interval: interval, mode: mode, handler: handler)
        timer.start()
        return timer
    }
    
    /// 创建一个定时器并执行
    ///
    /// - Parameters:
    ///   - interval: 间隔
    ///   - mode: 重复模式
    ///   - handler: 回调
    /// - Returns: Timer实例
    public class func schedule(_ interval: Interval, mode: Mode = .infinite, handler : @escaping Handler) -> Timer {
        let timer = Timer.new(interval: interval, mode: mode, handler: handler)
        timer.start()
        return timer
    }
    
    /// 手动开始执行
    ///
    /// - Parameters:
    ///   - runLoop: 需要添加到的RunLoop，默认`.current`
    ///   - modes: RunLoop的模式
    public func start(runLoop: RunLoop = .current, modes: [RunLoop.Mode] = [.default]) {
        for mode in modes {
            runLoop.add(self, forMode: mode)
        }
    }
    
    /// 恢复执行
    public func resume() {
        fireDate = Date(timeIntervalSinceNow: interval)
    }
    
    /// 暂停执行
    public func pause() {
        fireDate = .distantFuture
    }
}
