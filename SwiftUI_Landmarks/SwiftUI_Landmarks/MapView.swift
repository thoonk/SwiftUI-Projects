//
//  MapView.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/15.
//

import SwiftUI
import MapKit

struct MapView: View {
    /*
     @State로 선언된 프로퍼티의 storage를 관리
     값이 변하면 뷰의 appearance가 무효화되고 body를 재연산한다.
     주어진 뷰에서 신뢰가 있는 단일 소스로서 state를 사용
     */
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )

        var body: some View {
            /*
             state 변수 접두에 $을 붙이면 바인딩이 되고 이는 그 값에 대한 참조와 같음
             사용자가 상호작용할 때 맵은 사용자 인터페이스에 현재 표시되는 맵의 부분과 일치하다록 region값을 업데이트함
            */
            Map(coordinateRegion: $region)
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
