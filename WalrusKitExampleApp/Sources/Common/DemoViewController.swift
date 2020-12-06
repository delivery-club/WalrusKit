//
//  DemoViewController.swift
//  WalrusKitExampleApp
//
//  Created by Sakhey Ignatyev on 26.11.2020.
//

import UIKit
import SwiftUI

open class DemoViewController<UIKitView: UIView, SwiftUIView: View>: UIViewController {
    let uiKitView: UIView
    let swiftUIView: SwiftUIView
    private var contentViewSwiftUI: UIView!
    
    public init(uiKitView: UIKitView, swiftUIView: SwiftUIView) {
        self.uiKitView = uiKitView
        self.swiftUIView = swiftUIView
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        let segmentedControl = UISegmentedControl(frame: .zero)
        segmentedControl.insertSegment(withTitle: "UIKit", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "SwiftUI", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeSelection(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        contentView.addSubview(uiKitView)
        uiKitView.translatesAutoresizingMaskIntoConstraints = false
        
        let childView = UIHostingController(rootView: swiftUIView)
        addChild(childView)
        contentView.addSubview(childView.view)
        childView.didMove(toParent: self)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewSwiftUI = childView.view
        contentViewSwiftUI.isHidden = true
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),

            contentView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            uiKitView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            uiKitView.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiKitView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            uiKitView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            childView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            childView.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            childView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            childView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    @objc private func didChangeSelection(_ segmantedControl: UISegmentedControl) {
        uiKitView.isHidden = segmantedControl.selectedSegmentIndex == 1
        contentViewSwiftUI.isHidden = segmantedControl.selectedSegmentIndex == 0
    }
}

