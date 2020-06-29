//
//  ProfileView.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 30/06/2020.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Text("This is my profile")
        }
        .navigationTitle("Carbon Footprint")
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
