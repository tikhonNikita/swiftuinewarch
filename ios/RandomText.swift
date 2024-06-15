//
//  RandomText.swift
//  newarchswiftui
//
//  Created by Nikita Tikhonov on 15.06.2024.
//

import SwiftUI

struct RandomText: View {
  let text = RandomStringGenerator.randomString(length: 10)
    var body: some View {
        Text(text)
    }
}

#Preview {
    RandomText()
}
