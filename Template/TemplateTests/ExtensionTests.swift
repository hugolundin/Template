//
//  ExtensionTests.swift
//  TemplateTests
//
//  Created by Hugo Lundin on 2017-09-01.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import XCTest
@testable import Template

class ExtensionTests: XCTestCase {
    
    func testTrimmed() {
        XCTAssertEqual(" Hello ".trimmed, "Hello")
    }
    
    func testAlreadyTrimmed() {
        XCTAssertEqual("Hello".trimmed, "Hello")
    }
    
    func testLines() {
        XCTAssertEqual("Hello\nWorld".lines, ["Hello", "World"])
    }
    
    func testOneLine() {
        XCTAssertEqual("Hello World!".lines, ["Hello World!"])
    }
}
