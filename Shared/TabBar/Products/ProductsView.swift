//
//  ProductsView.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 29/06/2020.
//

import SwiftUI
import Combine

struct ProductsView: View {
    
    // MARK: - Binding
    
    @ObservedObject var viewModel: ProductsViewModel = ProductsViewModel(products: "")
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.darkBlue.edgesIgnoringSafeArea(.all)
            VStack {
                Image("StateImageTogether")
                    .resizable()
                Spacer()
                List(viewModel.entries, rowContent: ProductRow.init)
            }
            .navigationTitle("Products")
        }
        
    }
}

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack {
            Text("\(product.name ?? "Some Name")")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Spacer()
            if let value = Double(product.carbonFootprint ?? "2"), value > 1 {
                Image("BadgeSad")
            } else {
                Image("BadgeHappy")
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductsViewModel(products: "")
        var products = ProductsView()
        products.viewModel = viewModel
        return products
    }
}
