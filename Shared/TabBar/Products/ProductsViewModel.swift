//
//  ProductsViewModel.swift
//  CarbonFootprint
//
//  Created by Daniel Mandea on 29/06/2020.
//

import SwiftUI
import Combine

class ProductsViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    private var products: [Product]?
    
    @Published var entries: [Product] = [Product]()
    
    init(products: String) {
        guard let data = products.data(using: .utf8),
              let decoded = try? JSONDecoder().decode([Product].self, from: data)else { return }
        self.products = decoded
        fetchTopHeadlines()
    }
    
    func fetchTopHeadlines() {
        guard let url = URL(string: "http://169.51.194.87:32082/get_carbon_footprint_report") else { return }
        let httpBody = products?.map{ $0.generate() }
        let dict = ["products": httpBody]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(dict)
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [String: String].self, decoder: JSONDecoder())
            .replaceError(with: [String: String]())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { posts in
                for post in posts.keys {
                    guard var value = self.products?.filter({ "\($0.id)" == post}).first else {
                        continue
                    }
                    value.carbonFootprint = posts[post]
                    self.entries.append(value)
                }
            })
    }
}

struct Product: Codable, Identifiable {
    var id: Int
    var name: String?
    var amount: Double?
    var unit: String?
    var percent: String?
    var price: Double?
    var carbonFootprint: String?
    
    func generate() -> ProductData {
        ProductData(id: "\(id)", weight: "\(amount ?? 0)", quantity: "\(amount ?? 0)")
    }
}

struct ProductData: Codable, Identifiable {
    var id: String?
    var weight: String?
    var quantity: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case weight
        case quantity
    }
}
