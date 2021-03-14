//
//  Currency.swift
//  Domain
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

public struct Currency: Equatable, Codable {
    public let code: String
    public let numeric: Int16

    public init?(code: String) {
        guard let value = Currencies.shared.numericFor(code: code) else {
            return nil
        }

        self.numeric = value
        self.code = code
    }

    public init?(numeric: Int16) {
        guard let value = Currencies.shared.codeFor(numeric: numeric) else {
            return nil
        }

        self.code = value
        self.numeric = numeric
    }

    public init?(iban: String?) {
        guard let iban = iban else {
            return nil
        }

        guard let numeric = Int16(iban.suffix(3)) else {
            return nil
        }

        guard let value = Currencies.shared.codeFor(numeric: numeric) else {
            return nil
        }


        self.code = value
        self.numeric = numeric
    }
}

public extension Currency {
    static let MDL = Currency(code: "MDL")!
    static let USD = Currency(code: "USD")!
    static let EUR = Currency(code: "EUR")!
}

public func ==(lhs: Currency, rhs: Currency) -> Bool {
    return lhs.numeric == rhs.numeric
}
