//
//  SpotifyCloneTests.swift
//  SpotifyCloneTests
//
//  Created by christian on 4/8/24.
//

import XCTest

final class SpotifyCloneTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false


    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testOpenSpotifyButtonPresentsNewView() throws {

        XCTAssertTrue(app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Open Spotify"]/*[[".cells.buttons[\"Open Spotify\"]",".buttons[\"Open Spotify\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssertTrue(app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Open Spotify"]/*[[".cells.buttons[\"Open Spotify\"]",".buttons[\"Open Spotify\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isHittable)
    
        app.collectionViews.buttons["Open Spotify"].tap()

        XCTAssertTrue(app.staticTexts["Your top mixes"].exists)
    }
}
 
