//
//  UITableView+Utils.swift
//  
//
//  Created by Denis Sancov on 4/12/21.
//

#if !os(macOS)

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        let reuseId = "\(cell)"
        let resource = "\(T.self)"

        if Bundle.main.path(forResource: resource, ofType: "nib") != nil {
            let nib = UINib(nibName: resource, bundle: nil)
            register(nib, forCellReuseIdentifier: reuseId)
        } else {
            register(cell, forCellReuseIdentifier: reuseId)
        }
    }

    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = "\(T.self)"
        return dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! T
    }

    func deselectRow(coordinator: UIViewControllerTransitionCoordinator?, animated: Bool = true) {
        guard let selectedIndexPath = indexPathForSelectedRow else { return }

        guard let coordinator = coordinator else {
            deselectRow(at: selectedIndexPath, animated: animated)
            return
        }

        coordinator.animate(
            alongsideTransition: { [unowned self] _ in
                deselectRow(at: selectedIndexPath, animated: true)
            },
            completion: { [unowned self] context in
                if context.isCancelled {
                    selectRow(at: selectedIndexPath, animated: false, scrollPosition: .none)
                }
            }
        )
    }

    func register<T: UITableViewHeaderFooterView>(section: T.Type) {
        let reuseId = "HeaderFooterReuseID_\(section)"
        register(section, forHeaderFooterViewReuseIdentifier: reuseId)
    }

    func dequeue<T: UITableViewHeaderFooterView>() -> T {
        let reuseId = "HeaderFooterReuseID_\(T.self)"
        let sectionView = dequeueReusableHeaderFooterView(withIdentifier: reuseId)
        return (sectionView ?? T.init(reuseIdentifier: reuseId)) as! T
    }

    func layoutSupplimentalViews() {
        if let header = tableHeaderView {
            header.resize()
            tableHeaderView = header
        }

        if let footer = tableFooterView {
            footer.resize()
            tableFooterView = footer
        }
    }
}

private extension UIView {
    func resize() {
        setNeedsLayout()
        layoutIfNeeded()

        let height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height

        var tmp = frame
        tmp.size.height = height
        frame = tmp
    }
}

#endif
