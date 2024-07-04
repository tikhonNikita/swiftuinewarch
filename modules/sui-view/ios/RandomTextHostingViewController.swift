//
//  RandomTextHoisingViewController.swift
//  newarchswiftui
//
//  Created by Nikita Tikhonov on 15.06.2024.
//

import Foundation
import SwiftUI


import SwiftUI

@objc public class RandomTextHostingController: UIViewController {
    private var viewModel: RandomTextViewModel
    
    @objc public init(viewModel: RandomTextViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupHostingController()
    }

    @objc public static func createViewController() -> RandomTextHostingController {
        let viewModel = RandomTextViewModel()
        return RandomTextHostingController(viewModel: viewModel)
    }
    
    @objc public func updateWith(text: String) {
        viewModel.updateText(text: text)
    }

    private func setupHostingController() {
        let hostingController = UIHostingController(rootView: RandomText(viewModel: viewModel))
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
