//
//  UICollectionView+Utils.swift
//  
//
//  Created by Denis Sancov on 4/12/21.
//

#if !os(macOS)

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(cell: T.Type) {
        let reuseId = "\(cell)"
        let resource = "\(T.self)"

        if Bundle.main.path(forResource: resource, ofType: "nib") != nil {
            let nib = UINib(nibName: resource, bundle: nil)
            register(nib, forCellWithReuseIdentifier: reuseId)
        } else {
            register(cell, forCellWithReuseIdentifier: reuseId)
        }
    }

    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = "\(T.self)"
        return dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! T
    }
}

#endif
