//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/18/21.
//

import Foundation

public extension String {
    var localized: String {
        return localize()
    }

    func localize(table: String? = nil, default: String? = nil) -> String {
        return NSLocalizedString(
            self,
            tableName: table,
            bundle: Bundle.main,
            value: `default` ?? "",
            comment: ""
        )
    }
}
