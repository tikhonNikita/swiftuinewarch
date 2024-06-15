//
//  RandomTextGetter.swift
//  newarchswiftui
//
//  Created by Nikita Tikhonov on 15.06.2024.
//

import Foundation

@objc public class RandomStringGenerator: NSObject {
    @objc public static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
