//
//  ViewTabs.swift
//  dmzj
//
//  Created by luxiao on 2021/2/5.
//

import UIKit
import SwiftUI
import BetterSegmentedControl

struct MyViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        let segments = LabelSegment.segments(withTitles: ["Music", "Movies", "Apps"],
                                             normalTextColor: .white,
                                             selectedTextColor: UIColor(red: 0.92, green: 0.29, blue: 0.15, alpha: 1.00))
        
        _ = LabelSegment.segments(withTitles: ["One", "Two", "Three", "Four", "Five"],
                                              normalFont: .systemFont(ofSize: 14.0),
                                              normalTextColor: UIColor(red: 0.15, green: 0.39, blue: 0.96, alpha: 0.9),
                                              selectedFont: .systemFont(ofSize: 14.0),
                                              selectedTextColor: UIColor(red: 0.16, green: 0.40, blue: 0.96, alpha: 1.00))
        
        let navigationSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 0, width: 200.0, height: 30.0),
            segments: segments,
            options: [.cornerRadius(15.0),
                      .backgroundColor(UIColor(red: 0.16, green: 0.64, blue: 0.94, alpha: 1.00)),
                      .indicatorViewBackgroundColor(.white)])
        
//        navigationSegmentedControl.addTarget(self, action: #selector(navigationSegmentedControlValueChanged(_:)), for: .valueChanged)
        navigationSegmentedControl.center.x = uiViewController.view.center.x
        uiViewController.view.addSubview(navigationSegmentedControl)
    }
    
    func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index)")
    }
}
