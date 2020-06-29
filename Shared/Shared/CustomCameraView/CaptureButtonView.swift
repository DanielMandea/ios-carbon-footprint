//
//  CaptureButtonView.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 28/06/2020.
//

import SwiftUI

struct CaptureButtonView: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Image(systemName: "video").font(.largeTitle)
            .padding(30)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false))
        )
            .onAppear
            {
                self.animationAmount = 2
        }
    }
}
