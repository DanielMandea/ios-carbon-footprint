//
//  RoundedButton.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 26/06/2020.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.neonGreen)
            .background(Color.darkBlue)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.neonGreen, lineWidth: 2)
            )
    }
}


struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Delete tapped!")
        }) {
            HStack {
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
            }
        }.buttonStyle(RoundedButtonStyle())
    }
}
