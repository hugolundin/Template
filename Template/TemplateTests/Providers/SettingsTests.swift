//
//  SettingsTests.swift
//  TemplateTests
//
//  Created by Hugo Lundin on 2017-08-29.
//  Copyright © 2017 Hugo Lundin. All rights reserved.
//

import XCTest
@testable import Template

class LocalProviderTests: XCTestCase {
    let identifier = "TestUserDefaults"
    var defaults: UserDefaults?
    var settings: SettingsProvider!
    
    override func setUp() {
        super.setUp()
        
        guard let defaults = UserDefaults(suiteName: identifier) else {
            XCTFail()
            return
        }
        
        settings = Local(defaults: defaults)
    }
    
    func testSetAPIToken() {
        settings.apiToken = "123"
        XCTAssertEqual(settings.apiToken, "123")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        UserDefaults().removePersistentDomain(forName: identifier)
    }
}

class SettingsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
