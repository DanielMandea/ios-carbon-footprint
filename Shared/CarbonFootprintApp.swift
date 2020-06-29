//
//  CarbonFootprintApp.swift
//  Shared
//
//  Created by Daniel Mandea on 26/06/2020.
//

import SwiftUI

@main
struct CarbonFootprintApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

struct CarbonFootprintApp_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
