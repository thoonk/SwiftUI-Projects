//
//  PageViewController.swift
//  SwiftUI_Landmarks
//
//  Created by 김태훈 on 2021/06/28.
//

import SwiftUI
import UIKit

/// UIViewControllerRepresentable 프로토콜을 통해 SwiftUI에서 UIKit 뷰컨을 
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    /// makeUIVIewController() 전에 이 메서드를 호출해야
    /// 뷰컨을 설정할 때 coordinator 객체에 접근할 수 있음
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// UIPageViewController 생성하는 함수
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    /// SwiftUI로부터 새로운 정보와 함께 뷰컨을 갱신하는 함수
    func updateUIViewController(
        _ pageViewController: UIPageViewController,
        context: Context
    ) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }
    
    /// UIKit의 뷰컨을 나타내는 SwiftUI 뷰는 Swift의 Coordinator 타입을 정의할 수 있고
    /// SwiftUI는 표시 가능한 뷰의 context를 관리하고 제공함
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
