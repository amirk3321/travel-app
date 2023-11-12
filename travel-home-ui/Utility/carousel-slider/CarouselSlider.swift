//
//  CarouselSlider.swift
//  travel-home-ui
//
//  Created by MA on 05/11/2023.
//

import SwiftUI
import UIKit

struct CarouselSliderView : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = CustomPageViewController()
       
        return redVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
   
    
}


class CustomPageViewController : UIPageViewController, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       return firstView
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if (viewController == secondView) {
            return nil
        }
        return secondView
    }
    
    
    let firstView = UIHostingController(rootView: Text("First View Controller"))
    let secondView = UIHostingController(rootView: Text("2nd Page View Controller"))
    let thirdView = UIHostingController(rootView: Text("2nd Page View Controller"))
    
    lazy var allViewControllerList : [UIViewController] =  [
    firstView , secondView , thirdView ]
 
    init(){
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        view.backgroundColor = .orange
        
        setViewControllers([firstView], direction: .forward, animated: true, completion: nil)
        
        
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(NSCoder) has been implemented")
    }
    
    
}

#Preview {
    CarouselSliderView()
}
