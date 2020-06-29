//
//  Dashboard.swift
//  Donations
//
//  Created by Daniel Mandea on 23/06/2020.
//  Copyright © 2020 IBM CJ COVID. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    
    // MARK: - Binding
    
    @Binding var isPickerPresented: Bool
    
    // MARK: - State
    
    @Binding var scannedCode: String?
    
    // MARK: - Model
    
    let badges: [Badge]
    
    init(isPickerPresented: Binding<Bool>, scannedCode: Binding<String?>) {
        badges = [
            Badge(id: "1", title: "20", image: "BadgeAlmostHappy"),
            Badge(id: "2", title: "40", image: "BadgeHappy"),
            Badge(id: "3", title: "80", image: "BadgeImage"),
            Badge(id: "4", title: "100", image: "BadgeSeal"),
            Badge(id: "5", title: "140", image: "BadgeSad")
        ]
        self._isPickerPresented = isPickerPresented
        self._scannedCode = scannedCode
    }
    
    // MARK: - Body 
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.scannedCode != nil, let value = $scannedCode.wrappedValue {
                    navigation(for: value).hidden()
                }
                Color.darkBlue.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("A carbon footprint can be a broad meaasure or be applied to the actions of an individual, a family, an event, an organization, or even an entire nation.")
                        .foregroundColor(.white)
                        .font(.body).foregroundColor(Color.white)
                        .padding([.top, .bottom, .trailing, .leading], 20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    Spacer()
                    Text("Your earned badges")
                        .foregroundColor(.white)
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom, .trailing, .leading], 20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    // statuses
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 10) {
                            ForEach(badges) { badge in
                                BadgeRow(badge: badge)
                            }
                        }
                        .padding(.leading, 20)
                    })
                    .padding(.bottom, 20)
                    Button(action: {
                        isPickerPresented.toggle()
                    }) {
                        HStack {
                            Text("Scan")
                                .font(.title2)
                                .padding()
                        }
                    }
                    .frame(alignment: .center)
                    .buttonStyle(RoundedButtonStyle())
                    .padding([.leading, .trailing], 100)
                    Spacer()
                }
                .foregroundColor(Color.darkBlue)
                .background(Color.darkBlue)
            }
            .navigationTitle("Carbon Footprint")
        }
    }
    
    
    func navigation(for value: String) -> NavigationLink<Text, ProductsView> {
        let viewModel = ProductsViewModel(products: value)
        var view = ProductsView()
        view.viewModel = viewModel
        return NavigationLink("Next page", destination: view, isActive: .constant(true))
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(isPickerPresented: .constant(false), scannedCode: .constant(nil))
    }
}
