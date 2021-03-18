//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/13/21.
//

import Foundation

public extension String {
    static func minifiedFrom(contentOf path: String) throws -> String {
        let content = try String(contentsOfFile: path)
        return content.components(separatedBy: .newlines).joined()
    }

    var trimWhitespaces: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var pairs: [String] {
        var result: [String] = []
        let characters = Array(self)
        stride(from: 0, to: count, by: 2).forEach {
            result.append(String(characters[$0..<min($0+2, count)]))
        }
        return result
    }

    var isBool: Bool {
        let tmp = self.lowercased()
        return tmp == "false" || tmp == "true"
    }

    var digits: String {
        let set = CharacterSet.decimalDigits.inverted
        return components(separatedBy: set).joined()
    }

    mutating func insert(separator: String, every n: Int) {
        self = inserting(separator: separator, every: n)
    }

    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""

        let characters = Array(self)

        stride(from: 0, to: count, by: n).forEach {
            result += String(characters[$0..<min($0+n, count)])
            if $0+n < count {
                result += separator
            }
        }

        return result
    }


    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    func lowercasingFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }

    mutating func lowercaseFirstLetter() {
        self = self.lowercasingFirstLetter()
    }
}
