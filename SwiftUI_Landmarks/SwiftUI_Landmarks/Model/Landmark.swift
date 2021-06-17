//
//  Landmark.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/16.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    // imageName을 통해 image에서 연산된 Image를 로드할 수 있도록 함
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    // JSON data 구조에 따라 생성한 구조체
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
