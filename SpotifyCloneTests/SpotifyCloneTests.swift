//
//  SpotifyCloneTests.swift
//  SpotifyCloneTests
//
//  Created by christian on 4/8/24.
//

import XCTest

final class SpotifyCloneTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let app = XCUIApplication()
        
        app.launch()
        
        XCTAssertTrue(app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Open Spotify"]/*[[".cells.buttons[\"Open Spotify\"]",".buttons[\"Open Spotify\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssertTrue(app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Open Spotify"]/*[[".cells.buttons[\"Open Spotify\"]",".buttons[\"Open Spotify\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isHittable)
                 
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
 
