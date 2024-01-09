//
//  FlagImage.swift
//  GeussTheFlag
//
//  Created by thoonk on 2024/01/09.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

extension FlagImage {
    init(_ name: String) {
        self.imageName = name
    }
}
