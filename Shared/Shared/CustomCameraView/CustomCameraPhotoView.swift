//
//  CustomCameraPhotoView.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 28/06/2020.
//

import SwiftUI
import AVFoundation

struct CustomCameraPhotoView: View {

    @State private var image: Image?
    @State private var showingCustomCamera = false
    @State private var inputImage: UIImage?

    var body: some View {

        NavigationView {
            VStack {
                ZStack {
                    Rectangle().fill(Color.secondary)

                    if image != nil
                    {
                        image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    else
                    {
                        Text("Take Photo").foregroundColor(.white).font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingCustomCamera = true
                }
            }
            .sheet(isPresented: $showingCustomCamera, onDismiss: loadImage) {
                CustomCameraView(image: self.$inputImage)
            }
            .edgesIgnoringSafeArea(.all)

        }

    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
