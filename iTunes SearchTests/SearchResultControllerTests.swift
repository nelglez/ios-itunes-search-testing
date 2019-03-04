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
        let mock = MockDataLoader.init(data: nil, error: nil)
    }

}
