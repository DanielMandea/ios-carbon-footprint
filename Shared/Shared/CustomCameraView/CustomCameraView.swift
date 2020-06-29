//
//  CustomCameraView.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 28/06/2020.
//

import SwiftUI

struct CustomCameraView: View {

    @Binding var image: UIImage?
    @State var didTapCapture: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomCameraRepresentable(image: self.$image, didTapCapture: $didTapCapture)
            CaptureButtonView().onTapGesture {
                self.didTapCapture = true
            }
        }
    }

}
