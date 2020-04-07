//
//  UIView+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

// MARK: -  截图

extension UIView {
    
    /// 截图方式
    public enum SnapshotType {
        /// 正常方式
        case normal
        /// 如果一些视图是用OpenGL渲染出来的，使用此方式
        case opengl
    }
    
    /// 获取截图
    ///
    /// - Parameters:
    ///   - rect: 截图范围，默认为CGRect.zero
    ///   - scale: 图片缩放因子，默认为屏幕缩放因子
    ///   - type: 截图方式，默认为normal
    /// - Returns: 截图
    public func snapshotImage(_ rect: CGRect = .zero, scale: CGFloat = UIScreen.main.scale, type: SnapshotType = .normal) -> UIImage? {
        // 获取整个区域图片
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        /// 截图
        switch type {
        case .normal:
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            layer.render(in: context)
        case .opengl:
            drawHierarchy(in: frame, afterScreenUpdates: true)
        }
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        // 如果不裁剪图片，直接返回整张图片
        if rect.equalTo(.zero) || rect.equalTo(bounds) {
            return image
        }
        // 按照给定的矩形区域进行剪裁
        guard let sourceImageRef = image.cgImage else { return nil }
        let newRect = rect.applying(CGAffineTransform(scaleX: scale, y: scale))
        guard let newImageRef = sourceImageRef.cropping(to: newRect) else { return nil }
        
        // 将CGImageRef转换成UIImage
        let newImage = UIImage(cgImage: newImageRef, scale: scale, orientation: .up)
        return newImage
    }
    
}
