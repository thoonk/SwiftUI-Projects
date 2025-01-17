//
//  Job.swift
//  SwiftDataProject
//
//  Created by thoonk on 1/17/25.
//

import Foundation
import SwiftData

@Model
final class Job {
    var name: String = "None"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
