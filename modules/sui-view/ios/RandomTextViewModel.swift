import SwiftUI

@objc public class RandomTextViewModel: NSObject, ObservableObject {
    @Published @objc public var text: String
    
    @objc public override init() {
        self.text = RandomStringGenerator.randomString(length: 10)
    }
    
    @objc public func updateText(text: String) {
        self.text = text
    }
}
