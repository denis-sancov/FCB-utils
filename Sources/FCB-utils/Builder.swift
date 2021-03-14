//
//  Builder.swift
//  
//
//  Created by Denis Sancov on 3/13/21.
//

import Foundation

public protocol Builder {}

public extension Builder {

    @discardableResult
    @inline(__always)
    func also(configure: (inout Self) -> Void) -> Self {
        var this = self
        configure(&this)
        return this
    }

    @inline(__always)
    func with<T>(configure: (Self) -> T) -> T {
        return configure(self)
    }
}

extension NSObject: Builder {}

extension URLComponents: Builder {}
