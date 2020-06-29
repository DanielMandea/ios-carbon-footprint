//
//  MainTabView.swift
//  Donations
//
//  Created by Daniel Mandea on 23/06/2020.
//  Copyright © 2020 IBM CJ COVID. All rights reserved.
//

import Foundation
import SwiftUI
import CodeScanner

struct MainTabView: View {
    
    @State var isPickerPresented: Bool = false
    @State var isCameraViewPreented: Bool = false
    @State var scannedCode: String? = nil
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.darkBlue
    }
    
    var body: some View {
        ZStack{
            TabView {
                Dashboard(isPickerPresented: $isPickerPresented, scannedCode: $scannedCode)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                            .foregroundColor(Color.darkBlue)
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                            .foregroundColor(Color.darkBlue)
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("All Products")
                            .foregroundColor(Color.darkBlue)
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                            .foregroundColor(Color.darkBlue)
                    }
            }
            .font(.headline)
            .background(Color.darkBlue)
            .accentColor(.neonGreen)
            BottomSheetView(isOpen: $isPickerPresented, maxHeight: 400) {
                VStack {
                    Text("Scan your invoice")
                        .foregroundColor(.white)
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom, .trailing, .leading], 20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    Text("Use one of the options below in order to scan your invoice")
                        .foregroundColor(.white)
                        .font(.body).foregroundColor(Color.white)
                        .padding([.top, .bottom, .trailing, .leading], 20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.isCameraViewPreented.toggle()
                    }) {
                        VStack {
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.neonGreen)
                            Text("Product Scan")
                                .font(.subheadline)
                                .foregroundColor(Color.neonGreen)
                                .padding()
                        }
                    }
                    Spacer()
                    Divider().background(Color.white)
                        .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action: {
                        self.isCameraViewPreented.toggle()
                    }) {
                        VStack {
                            Image(systemName: "doc.text.viewfinder")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.neonGreen)
                            Text("Bill Scan")
                                .font(.subheadline)
                                .foregroundColor(Color.neonGreen)
                                .padding()
                        }
                    }
                    Spacer()
                }
                Spacer()
            }.edgesIgnoringSafeArea(.all)
        }.sheet(isPresented: $isCameraViewPreented) {
            self.scannerSheet
        }
    }
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isCameraViewPreented.toggle()
                }
            }
        )
    }
}

extension String {
    func convertToDictionary() throws -> [String: Any] {
        guard let data = data(using: .utf8) else { return [:] }
        let anyResult: Any = try JSONSerialization.jsonObject(with: data, options: [])
        return anyResult as? [String: Any] ?? [:]
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .background(Color.red)
    }
}

