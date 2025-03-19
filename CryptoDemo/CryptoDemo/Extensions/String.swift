//
//  String.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/19/25.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
