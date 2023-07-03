//
//  UserSettings.swift
//  ObservableObjectExample
//
//  Created by thoonk on 2023/07/03.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var score: Int = 0
}
