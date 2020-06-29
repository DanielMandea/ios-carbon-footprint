//
//  LoginView.swift
//  Donations
//
//  Created by Daniel Mandea on 07/05/2020.
//  Copyright © 2020 IBM CJ COVID. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var loggedIn: Bool = false
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .center)  {
            Text("Carbon Footprint")
                .foregroundColor(.neonGreen)
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            Image("LogoImage")
                .resizable()
                .padding([.leading, .trailing, .top, .bottom], 10)
            Text("Login using Facebook in order to access Climate App")
                .foregroundColor(.neonGreen)
                .font(.body).foregroundColor(Color.white)
                .padding([.top, .bottom, .trailing, .leading], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            VStack(alignment: .leading, spacing: 15) {
                Button(action: {
                    loggedIn.toggle()
                }) {
                    HStack {
                        Text("Facebook Login")
                            .font(.title2)
                            .padding()
                    }
                }
                .buttonStyle(RoundedButtonStyle())
            }
            Spacer()
        }
        .modalLink(isPresented: $loggedIn, linkType: ModalTransition.fullScreenModal, destination: { MainTabView() })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(LinearGradient(gradient: Gradient(colors: [.darkBlue, .lightBlue]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

