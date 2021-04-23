//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/21/21.
//

import Foundation

public enum State<T> {
    case loading
    case success(rows: [T])
    case error(err: Error)

    public var rows: [T]? {
        switch self {
        case .success(let rows):
            return rows
        default:
            return nil
        }
    }
}
