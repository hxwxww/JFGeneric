//
//  ArrayTests.swift
//  JFGenericTests
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import XCTest
import JFGeneric

class ArrayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSubscript() {
        let array = [1, 2, 3, 4, 5]
        let num = array[safe: 1]
        XCTAssertEqual(num, 2)
    }
    
    func testRemove() {
        var array = [1, 2, 3, 4, 5]
        array.removeElement(1)
        XCTAssertEqual(array, [2, 3, 4, 5])

        array.removeElements([3, 5])
        XCTAssertEqual(array, [2, 4])
    }
}
