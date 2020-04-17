//
//  CGFloat+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/17.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

extension CGFloat {
    
    /// 屏幕宽度
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// 屏幕高度
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 状态栏高度
    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    /// 导航栏高度
    public static var navBarHeight: CGFloat {
        return screenHeight > 400 ? 44 : 32
    }
    
    /// 标签栏高度
    public static var tabBarHeight: CGFloat {
        if #available(iOS 11.0, *) {
            if screenHeight < 400 {
                return 32
            }
        }
        return 49
    }
    
    /// 底部HomeIndicator高度
    public static var homeIndicatorHeight: CGFloat {
        if UIDevice.isIPhoneX {
            return UIDevice.isPortrait ? 34 : 21
        }
        return 0
    }
    
    /// 状态栏和导航栏总高度
    public static var navBarAndStatusBarHeight: CGFloat {
        return navBarHeight + statusBarHeight
    }

    /// 标签栏和HomeIndicator总高度
    public static var tabBarAndHomeIndicatorHeight: CGFloat {
        return tabBarHeight + homeIndicatorHeight
    }
}

extension CGFloat {
    
    /// 间隔2px
    public static let spacing2: CGFloat = 2
    
    /// 间隔4px
    public static let spacing4: CGFloat = 4
    
    /// 间隔8px
    public static let spacing8: CGFloat = 8
    
    /// 间隔16px
    public static let spacing16: CGFloat = 16
    
    /// 间隔32px
    public static let spacing32: CGFloat = 32
}
