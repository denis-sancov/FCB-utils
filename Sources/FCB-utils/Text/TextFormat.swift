//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import Foundation

public protocol TextFormat {
    associatedtype Value

    func from(text: String?) -> Value?
    func from(value: Value?) -> String?

    init()
}

public struct StringFormat: TextFormat {
    public typealias Value = String

    public init() {

    }

    public func from(text: String?) -> String? {
        return text
    }

    public func from(value: String?) -> String? {
        return value
    }
}

public struct AmountFormat: TextFormat {
    public typealias Value = Decimal

    public let currency: Currency?
    public let nf: NumberFormatter

    public init() {
        self.init(currency: nil)
    }

    public init(currency: Currency? = nil) {
        self.currency = currency

        self.nf = NumberFormatter().also {
            $0.generatesDecimalNumbers = true

            $0.maximumFractionDigits = 2
            $0.minimumFractionDigits = 2

            $0.numberStyle = .currencyISOCode

            $0.currencyCode = currency?.code
        }
    }

    public func from(text: String?) -> Decimal? {
        guard let txt = text, var value = nf.number(from: txt)?.decimalValue else {
            return nil
        }

        var result: Decimal = Decimal()

        NSDecimalRound(&result, &value, 4, .bankers)

        return result
    }

    public func from(value: Decimal?) -> String? {
        guard let value = value else {
            return nil
        }

        return nf.string(from: value.asNumber)
    }

}

public struct DateFormat: TextFormat {
    public typealias Value = Date

    public let df: DateFormatter

    public init() {
        self.init(dateStyle: .medium, timeStyle: .none)
    }

    public init(
        dateStyle: DateFormatter.Style = .medium,
        timeStyle: DateFormatter.Style = .none
    ) {
        self.df = DateFormatter().also {
            $0.dateStyle = dateStyle
            $0.timeStyle = timeStyle
        }
    }

    public func from(text: String?) -> Date? {
        guard let txt = text else {
            return nil
        }

        return df.date(from: txt)
    }

    public func from(value: Date?) -> String? {
        guard let value = value else {
            return nil
        }

        return df.string(from: value)
    }
}
