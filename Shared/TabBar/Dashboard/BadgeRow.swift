//
//  BadgeRow.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 27/06/2020.
//

import SwiftUI


struct BadgeRow: View {
    
    var badge: Badge

    var body: some View {
        VStack {
            Image(badge.image)
                .resizable()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text(badge.title)
                .foregroundColor(.white)
        }
    }
}

struct BadgeRow_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRow(badge: Badge(id: "1", title: "Test", image: "BadgeImage"))
    }
}
