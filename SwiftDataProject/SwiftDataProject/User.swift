//
//  User.swift
//  SwiftDataProject
//
//  Created by thoonk on 1/17/25.
//

import Foundation
import SwiftData

@Model
final class User {
    // CloudKit 연동 시 Default Value 또는 Optional 필요
    var name: String = "None"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    // Optional 필요
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        jobs ?? []
    }

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
