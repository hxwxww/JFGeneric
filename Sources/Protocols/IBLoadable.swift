//
//  IBLoadable.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

// MARK: -  xib加载协议

public protocol XibLoadable {}

extension XibLoadable {
    
    /// 通过xib加载View
    public static func loadFromXib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}

// MARK: -  UIView

extension UIView: XibLoadable {}

// MARK: - Storyboard加载协议

public protocol StoryboardLoadable {}

// MARK: -  UIViewController

extension UIViewController: StoryboardLoadable {}

extension StoryboardLoadable where Self: UIViewController {
    
    /// 通过storyboard加载ViewController
    public static func loadFromStoryboard(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: "\(self)") as! Self
    }
    
    /// 通过storyboard的名称加载ViewController
    public static func loadFromStoryboard(_ name: String) -> Self {
        return loadFromStoryboard(UIStoryboard(name: name, bundle: nil))
    }
}

// MARK: -  UIStoryboard

extension UIStoryboard {
    
    /// 加载指定的ViewController
    public func loadViewController<T: UIViewController>(with viewControllerClass: T.Type) -> T {
        return viewControllerClass.loadFromStoryboard(self)
    }
}
