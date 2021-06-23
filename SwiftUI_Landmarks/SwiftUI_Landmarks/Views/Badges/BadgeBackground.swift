//
//  BadgeBackground.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/23.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        // GeometryReader를 사용하여 동적으로 뷰를 그리거나 위치 및 크기 조정할 때
        // 값을 하드 코딩 대신 크기를 정의하는 포함하는 뷰의 크기를 사용할 수 있도록 함.
        GeometryReader { geometry in
            // shape path(lines, curves, etc.)
            Path { path in
                // 시작 포인트
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                // move(to:) - 그리기 시작할 때까지 대기하며
                // 영역 위를 맴도는 것처럼 그리기 커서를 경계 내에서 이동하는 함수
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // 선을 매끄럽게 하기 위해 Corner에 베지어 곡선을 적용하여 그리는 함수
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(LinearGradient(
                    gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(
        red: 230.0 / 255,
        green: 120.0 / 255,
        blue: 221.0 / 255
    )
    static let gradientEnd = Color(
        red: 239.0 / 255,
        green: 172.0 / 255,
        blue: 120.0 / 255
    )
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
