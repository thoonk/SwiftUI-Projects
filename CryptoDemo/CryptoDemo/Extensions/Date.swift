//
//  Date.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/19/25.
//

import Foundation

extension Date {
    
    init(dateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: dateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortString() -> String {
        return shortFormatter.string(from: self)
    }
}
