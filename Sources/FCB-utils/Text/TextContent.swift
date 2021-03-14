//
//  TextContent.swift
//  Shared
//
//  Created by Denis Sancov on 3/13/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

public enum TextContent {
    case email, password, text, phone, iban, numeric

    public var isSecureTextEntry: Bool {
        return self == .password
    }

    public var length: Int {
        switch self {
        case .iban:
            return 24
        default:
            return 60
        }
    }

    public var regex: String? {
        switch self {
        case .iban:
            return "[^A-Za-z0-9]"
        default:
            return nil
        }
    }
}
