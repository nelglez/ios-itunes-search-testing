//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Nelson Gonzalez on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search


class MockDataLoader: NetworkDataLoader {
    let data: Data?
    let error: Error?
    private(set) var request: URLRequest? = nil
    
    init(data: Data?, error: Error?){
        self.data = data
        self.error = error
    }
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        //provide data
        self.request = request
        completion(data, error)
    }
}

class SearchResultControllerTests: XCTestCase {

    func testValidData() {
        let mock = MockDataLoader(data: garagebandJSON, error: nil)
        let searchResultsController = SearchResultController(dataLoader: mock)
        
        searchResultsController.performSearch(for: "Garageband", resultType: .software) {
            
            XCTAssertNotNil(mock.request)
            
            let testComponents = URLComponents(url: URL(string: "https://itunes.apple.com/search?entity=software&term=Garageband")!, resolvingAgainstBaseURL: true)
            let components = URLComponents(url: mock.request!.url!, resolvingAgainstBaseURL: true)
            XCTAssertEqual(components, testComponents)
            
            XCTAssertEqual(searchResultsController.searchResults.count, 1)
            let firstObject = searchResultsController.searchResults.first!
            XCTAssertEqual(firstObject.title, "GarageBand")
        }
    }

}
