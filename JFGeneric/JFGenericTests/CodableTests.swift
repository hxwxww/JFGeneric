//
//  CodableTests.swift
//  JFGenericTests
//
//  Created by HongXiangWen on 2020/4/3.
//  Copyright © 2020 WHX. All rights reserved.
//

import XCTest
import JFGeneric

struct Student: Codable {
    let name: String
    let age: Int?
    let score: Double?
    
    init(name: String, age: Int, score: Double) {
        self.name = name
        self.age = age
        self.score = score
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPacked(forKey: .name, default: "")
        age = try container.decodeIfPacked(forKey: .age)
        score = try container.decodeIfPacked(forKey: .score)
    }
    
}

struct Teacher: Codable {
    let name: String
    let course: String?
    let age: Int?
    
    init(name: String, course: String, age: Int?) {
        self.name = name
        self.course = course
        self.age = age
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(forKey: .name, default: "")
        course = try container.decode(forKey: .course)
        age = try container.decode(forKey: .age)
    }
}

class CodableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecode() {
        let jsonData = """
           [
               {
                   "name": "Banana",
                   "age": 20,
                   "course": "Math"
               },
               {
                   "name": "Orange",
                   "course": "English"
               },
               {
                    "name": "Apple",
                    "age": 25
                }
           ]
        """.data(using: .utf8)!
        let teachers = try! JSONDecoder().decode([Teacher].self, from: jsonData)
        print(teachers)
        XCTAssertEqual(teachers[0].name, "Banana")
        XCTAssertEqual(teachers[1].course, "English")
        XCTAssertEqual(teachers[2].age, 25)
    }
    
    func testDecodeIfPacked() {
        let jsonData = """
           [
               {
                   "name": "Banana",
                   "age": "20",
                   "score": 90
               },
               {
                   "name": "Orange",
                   "age": 10
               },
               {
                    "name": "Apple",
                    "score": "99"
                }
           ]
        """.data(using: .utf8)!
        let students = try! JSONDecoder().decode([Student].self, from: jsonData)
        print(students)
        XCTAssertEqual(students[0].age, 20)
        XCTAssertEqual(students[1].name, "Orange")
        XCTAssertEqual(students[2].score, 99)
    }

}
