//
//  UIDevice+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/17.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

extension UIDevice {
    
    /// 是否为iPad
    public static var isIPad: Bool {
        return current.userInterfaceIdiom == .pad
    }
    
    /// 是否为iPhone
    public static var isIPhone: Bool {
        return current.userInterfaceIdiom == .phone
    }
    
    /// 是否是竖屏
    public static var isPortrait: Bool {
        return current.orientation == .portrait || current.orientation == .portraitUpsideDown
    }
    
    /// 是否是横屏
    public static var isLandscape: Bool {
        return current.orientation == .landscapeLeft || current.orientation == .landscapeRight
    }
    
    /// 是否是IPhoneX
    public static var isIPhoneX: Bool {
        let screenHieght = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        if screenHieght == 812 || screenHieght == 896 || screenWidth == 812 || screenHieght == 896 {
            return true
        }
        return false
    }
}
