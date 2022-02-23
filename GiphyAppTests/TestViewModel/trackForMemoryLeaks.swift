//
//  trackForMemoryLeaks.swift
//  GiphyAppTests
//
//  Created by hany karam on 2/19/22.
//

import XCTest
extension XCTestCase {
    func trackForMemoryLeaks(instance: AnyObject,file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance ] in
            XCTAssertNil(instance ,"Instance should have been deallcated. potential memory leak ", file: file,line: line)
        }
    }
}
