//
//  a5mk2SDKTests.swift
//  a5mk2SDKTests
//
//  Created by matsumoto on 2019/09/04.
//  Copyright © 2019 zyyx. All rights reserved.
//

import XCTest
@testable import a5mk2SDK

class a5mk2SDKTests: XCTestCase {
    
    let reader = A5MK2Reader(Bundle(for: a5mk2SDKTests.self).url(forResource: "test", withExtension: "a5er")!)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let entites: Array<Entity> = [Entity(phisicalName: "test1", logicalName: "test")]
        
        XCTAssertEqual(reader.readAllEntities(), entites)
    }

}
