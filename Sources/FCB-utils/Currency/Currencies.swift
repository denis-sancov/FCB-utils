//
//  CurrencyBuilder.swift
//  Domain
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

final class Currencies {
    static let shared = Currencies()

    private let map: [Int16: String]

    private init() {
        guard let path = Bundle.module.path(forResource: "ISO-4217", ofType: "plist") else {
            fatalError("ISO-4217.plist file doesn't exists")
        }

        guard let content = NSArray(contentsOfFile: path) as? [[String: Any]] else {
            fatalError("Data from ISO-4217.plist can not be read")
        }

        var buffer = [Int16: String]()
        buffer.reserveCapacity(content.count)

        content.forEach {
            let tmpId = $0["digitsCode"] as? String
            let tmpCode = $0["currencyCode"] as? String

            guard let id = Int16(tmpId ?? ""), let code = tmpCode else {
                return
            }

            buffer[id] = code
        }

        self.map = buffer
    }

    func numericFor(code: String) -> Int16? {
        return map.first { $0.value == code }?.key
    }

    func codeFor(numeric: Int16) -> String? {
        return map[numeric]
    }
}

