//
//  Date+Utils.swift
//  
//
//  Created by Denis Sancov on 3/13/21.
//

import Foundation

public extension Date {
    var dropTime: Date {
        let calendar = Calendar.current

        let components = calendar.dateComponents([.year, .month, .day], from: self)

        guard let date = calendar.date(from: components) else {
            fatalError("Failed to strip time from Date object")
        }

        return date
    }
}
