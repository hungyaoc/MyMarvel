//
//  MyMarvelTests.swift
//  MyMarvelTests
//
//  Created by Jeff Chen on 12/15/21.
//

import XCTest
@testable import MyMarvel

class MyMarvelTests: XCTestCase {

    var viewModal: HeroViewModal!
    var mockWebService: MockWebService!
    
    override func setUp() {
        mockWebService = MockWebService()
        viewModal = .init(webService: mockWebService)
    }
    
    func testViewModalWithSuccessSchoolList() {
        viewModal.getDataFromURL(completion: {(data:[String:Any]) in
            XCTAssertTrue(data != nil)
        })
    }

}
