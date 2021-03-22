//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/22/21.
//

import Foundation

public extension URL {
    var isBlank: Bool {
        return equals(to: "about:blank")
    }

    func equals(to value: String) -> Bool {
        return absoluteURL.absoluteString == value
    }
}
