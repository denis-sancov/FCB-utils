//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/13/21.
//

import Foundation

public extension Locale {
    func lang(valid: [String] = ["en", "ru", "ro"]) -> String {
        let lang = languageCode ?? "ro"
        return valid.contains(lang) ? lang : "ro"
    }
}
