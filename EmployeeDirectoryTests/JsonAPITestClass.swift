//
//  JsonAPI.swift
//  EmployeeDirectoryTests
//
//  Created by Kaival shah on 2020-07-30.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import XCTest
@testable import EmployeeDirectory

class JsonAPITestClass : XCTestCase {
    
    
    func testGetEmployeeListWithExpectedURLHostAndPath() {
        let jsonApi = JsonApi()
        let mockURLSession  = MockURLSession()
        jsonApi.session = mockURLSession
        jsonApi.getEmployeeList() { employees, error in }
        XCTAssertEqual(mockURLSession.url?.host, "s3.amazonaws.com")
        XCTAssertEqual(mockURLSession.url?.path, "/sq-mobile-interview/employees.json")
    }
}
