//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/20/21.
//

import Foundation

public extension Sequence {
    func firstAs<T>() -> T? {
        return compactMap { $0 as? T }.first
    }

    func firstAs<T>(lambda: (Element) throws -> Bool) -> T? {
        return try? first(where: lambda) as? T
    }

    func filter<T>() -> [T] {
        return compactMap { $0 as? T }
    }
}
