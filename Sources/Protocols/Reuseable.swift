//
//  Reuseable.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/3.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

// MARK: -  重用协议
public protocol Reuseable {}

extension Reuseable {
    
    /// 重用标识
    public static var reuseIdentifier: String {
        return "\(self)"
    }
    
    /// nib
    public static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    /// nib的路径
    public static var nibPath: String? {
        return Bundle.main.path(forResource: "\(self)", ofType: "nib")
    }
    
}

// MARK: -  UITableView

extension UITableViewCell: Reuseable {}
extension UITableViewHeaderFooterView: Reuseable {}

extension UITableView {
    
    /// 注册cell
    ///
    /// - Parameter cellClass: cellCalss
    public func registerCell<T: UITableViewCell>(cellClass: T.Type) {
        if T.nibPath != nil {
            /// 如果有nib，注册nib
            register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            /// 如果没有nib，注册class
            register(cellClass, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// 从缓存池取出cell，你需要在方法后面添加”as aClass“来显示的表示你所需要获取的cell的类型
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: 可重用的cell
    public func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Please register cell fisrt.")
        }
        return cell
    }
    
    /// 注册header/footer
    ///
    /// - Parameter headerFooterViewClass: headerFooterViewClass
    public func registerHeaderFooter<T: UITableViewHeaderFooterView>(headerFooterViewClass: T.Type) {
        if T.nibPath != nil {
            /// 如果有nib，注册nib
            register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            /// 如果没有nib，注册class
            register(headerFooterViewClass, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// 从缓存池取出header/footer，你需要在方法后面添加”as aClass“来显示的表示你所需要获取的header的类型
    ///
    /// - Returns: 可重用的header
    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let tablerHeaderFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Please register header/footer fisrt.")
        }
        return tablerHeaderFooter
    }
    
}

// MARK: -  UICollectionView

extension UICollectionReusableView: Reuseable {}

extension UICollectionView {
    
    /// 注册cell
    ///
    /// - Parameter cellClass: cellCalss
    public func registerCell<T: UICollectionViewCell>(cellClass: T.Type) {
        if T.nibPath != nil {
            /// 如果有nib，注册nib
            register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            /// 如果没有nib，注册class
            register(cellClass, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// 从缓存池取出cell，你需要在方法后面添加”as aClass“来显示的表示你所需要获取的cell的类型
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: 可重用的cell
    public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Please register cell fisrt.")
        }
        return cell
    }
    
    /// 注册header
    ///
    /// - Parameter reusableViewClass: reusableViewClass
    public func registerHeader<T: UICollectionReusableView>(reusableViewClass: T.Type) {
        if T.nibPath != nil {
            /// 如果有nib，注册nib
            register(T.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
        } else {
            /// 如果没有nib，注册class
            register(reusableViewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// 从缓存池取出header，你需要在方法后面添加”as aClass“来显示的表示你所需要获取的header的类型
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: 可重用的header
    public func dequeueReusableHeader<T: UICollectionReusableView>(indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Please register header fisrt.")
        }
        return header
    }
    
    /// 注册footer
    ///
    /// - Parameter reusableViewClass: reusableViewClass
    public func registerFooter<T: UICollectionReusableView>(reusableViewClass: T.Type) {
        if T.nibPath != nil {
            /// 如果有nib，注册nib
            register(T.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
        } else {
            /// 如果没有nib，注册class
            register(reusableViewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// 从缓存池取出header，你需要在方法后面添加”as aClass“来显示的表示你所需要获取的footer的类型
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: 可重用的footer
    public func dequeueReusableFooter<T: UICollectionReusableView>(indexPath: IndexPath) -> T {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Please register footer fisrt.")
        }
        return footer
    }
    
}
