//
//  CurrencyBuilder.swift
//  Domain
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

struct Currencies {
    static let shared = Currencies()

    private let currencies: [Currency]

    private init() {
        guard let url = Bundle.module.url(forResource: "ISO-4217", withExtension: "plist") else {
            fatalError("ISO-4217.plist file doesn't exists")
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            
            currencies = try decoder.decode([Currency].self, from: data)
        }
        catch {
            currencies = []

            print(error)
        }
    }

    func by(code: String) -> Currency? {
        return currencies.first { $0.code == code }
    }

    func by(numeric: Int16) -> Currency? {
        return currencies.first { $0.numeric == numeric }
    }
}

