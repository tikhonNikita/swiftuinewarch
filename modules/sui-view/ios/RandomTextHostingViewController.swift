//
//  RandomTextHoisingViewController.swift
//  newarchswiftui
//
//  Created by Nikita Tikhonov on 15.06.2024.
//

import Foundation
import SwiftUI


@objc public class RandomTextViewFactory: NSObject {
    @objc public static func createViewController() -> UIViewController {
        let hostingController = UIHostingController(rootView: RandomText())
        return hostingController
    }
}
