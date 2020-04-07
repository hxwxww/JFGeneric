//
//  StringTests.swift
//  JFGenericTests
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import XCTest
import JFGeneric

class StringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSubstringAt() {
        let string = "Hello World!"
        let subStr = string.substring(at: 3, length: 5)
        XCTAssertEqual(subStr, "lo Wo")
    }

    func testSubstringFrom() {
        let string = "Hello World!"
        let subStr = string.substring(from: 3)
        XCTAssertEqual(subStr, "lo World!")
    }

    func testSubstringTo() {
        let string = "Hello World!"
        let subStr = string.substring(to: 8)
        XCTAssertEqual(subStr, "Hello Wo")
    }

    func testSubstringOutOfBounds() {
        let string = "Hello World!"
        let subStr = string.substring(at: 5, length: 10)
        XCTAssertEqual(subStr, " World!")
        
        let subStr1 = string.substring(from: 15)
        XCTAssertEqual(subStr1, "")

        let subStr2 = string.substring(to: -1)
        XCTAssertEqual(subStr2, "")
    }
    
}
