//
//  ProductViewModelTests.swift
//  Tests iOS
//
//  Created by Daniel Mandea on 29/06/2020.
//

import XCTest
@testable import CarbonFootprint

class ProductViewModelTests: XCTestCase {
    
    var sut: ProductsViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ProductsViewModel(products: "")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
