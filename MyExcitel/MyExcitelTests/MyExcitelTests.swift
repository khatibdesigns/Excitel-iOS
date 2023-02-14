//
//  MyExcitelTests.swift
//  MyExcitelTests
//
//  Created by Nader Alkatib on 13.02.23.
//

import XCTest
import Alamofire

final class MyExcitelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRead() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let expectation = self.expectation(description: "Alamofire GET Request - Read Countries")
        
        ConnectionManager().read(data: [Countries](), endpoint: "countries") { data in
            XCTAssertNotNil(data, "Response should not be nil")
            expectation.fulfill()
        } failure: { error in
            XCTFail("Request failed with error: \(error)")
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
