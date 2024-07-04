//
//  RandomText.swift
//  newarchswiftui
//
//  Created by Nikita Tikhonov on 15.06.2024.
//

import SwiftUI

struct RandomText: View {
    @ObservedObject var viewModel: RandomTextViewModel
    
    var body: some View {
        Text(viewModel.text)
            .onTapGesture {
                viewModel.updateText(text: RandomStringGenerator.randomString(length: 10))
            }
    }
}
