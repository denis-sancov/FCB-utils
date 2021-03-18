//
//  TextFormatter.swift
//  Utils
//
//  Created by Denis Sancov on 3/13/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

public protocol TextFormatter {
    associatedtype Content

    func toString(value: Content?) -> String?
    func toValue(string: String?) -> Content?

    init()
}

public struct StringFormatter: TextFormatter {

    public init() {

    }

    public func toString(value: String?) -> String? {
        return value
    }

    public func toValue(string: String?) -> String? {
        return string
    }
}


public struct DecimalFormatter: TextFormatter {
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.allowsFloats = true
        formatter.generatesDecimalNumbers = true
        return formatter
    }()

    public init() {

    }

    public func toString(value: Decimal?) -> String? {
        guard let value = value else {
            return nil
        }

        return formatter.string(from: value as NSDecimalNumber)
    }

    public func toValue(string: String?) -> Decimal? {
        guard let txt = string, var value = formatter.number(from: txt)?.decimalValue else {
            return nil
        }

        var result: Decimal = Decimal()

        NSDecimalRound(&result, &value, 4, .bankers)

        return result
    }
}

//public struct DateFormatter: TextFormatter {
//    private let formatter: Foundation.DateFormatter
//
//    init() {
//        self.formatter = Foundation.DateFormatter()
//        self.fo
//    }
//}
