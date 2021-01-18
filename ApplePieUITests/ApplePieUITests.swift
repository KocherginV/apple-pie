//
//  ApplePieUITests.swift
//  ApplePieUITests
//
//  Created by Volodymyr Kochergin on 13.01.21.
//

import XCTest

class ApplePieUITests: XCTestCase {
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func initApp() -> XCUIApplication {
        let app = XCUIApplication()
        app.launch()
        return app
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStatisticUpdatedAfterGuess() throws {
        let app = initApp()
        app.staticTexts["B"].tap()
        app.staticTexts["U"].tap()
        app.staticTexts["C"].tap()
        app.staticTexts["A"].tap()
        app.staticTexts["N"].tap()
        app.staticTexts["E"].tap()
        app.staticTexts["R"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 1, Losses: 0, Points: 1", "Statistics was not displayed or had unexpected values!")
    }
    
    func testStatisticUpdatedAfterFail() throws {
        let app = initApp()
        app.staticTexts["Q"].tap()
        app.staticTexts["D"].tap()
        app.staticTexts["F"].tap()
        app.staticTexts["L"].tap()
        app.staticTexts["M"].tap()
        app.staticTexts["N"].tap()
        app.staticTexts["O"].tap()
        app.staticTexts["R"].tap()
        app.staticTexts["S"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 0, Losses: 1, Points: 0")
    }
    
    func testCanGuessAllWords() throws {
        let app = initApp()
        app.staticTexts["B"].tap()
        app.staticTexts["U"].tap()
        app.staticTexts["C"].tap()
        app.staticTexts["A"].tap()
        app.staticTexts["N"].tap()
        app.staticTexts["E"].tap()
        app.staticTexts["R"].tap()
        
        app.staticTexts["G"].tap()
        app.staticTexts["L"].tap()
        app.staticTexts["O"].tap()
        app.staticTexts["R"].tap()
        app.staticTexts["I"].tap()
        app.staticTexts["U"].tap()
        app.staticTexts["S"].tap()
        
        app.staticTexts["S"].tap()
        app.staticTexts["W"].tap()
        app.staticTexts["I"].tap()
        app.staticTexts["F"].tap()
        app.staticTexts["T"].tap()
        
        app.staticTexts["I"].tap()
        app.staticTexts["N"].tap()
        app.staticTexts["C"].tap()
        app.staticTexts["A"].tap()
        app.staticTexts["D"].tap()
        app.staticTexts["E"].tap()
        app.staticTexts["S"].tap()
        app.staticTexts["C"].tap()
        app.staticTexts["T"].tap()
        
        app.staticTexts["P"].tap()
        app.staticTexts["R"].tap()
        app.staticTexts["O"].tap()
        app.staticTexts["G"].tap()
        app.staticTexts["A"].tap()
        app.staticTexts["M"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 5, Losses: 0, Points: 5")
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "p r o g r a m")
    }
    
    func testPictureUpdatedAfterWrongLetter() throws {
        let app = initApp()
        app.staticTexts["Q"].tap()
        XCTAssert(app.images["tree_6_id"].exists, "Tree image was not displayed!")
        app.staticTexts["F"].tap()
        XCTAssert(app.images["tree_5_id"].exists, "Tree image was not displayed!")
    }
    
    func testLabelUpdatedAfterCorrectLetter() throws {
        let app = initApp()
        app.staticTexts["B"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "b _ _ _ _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testLabelUpdatedAfterMultipleCorrectLetters() throws {
        let app = initApp()
        app.staticTexts["C"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "_ _ c c _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testImageIsNotUpdatedAfterCorrectLetter() throws {
        let app = initApp()
        app.staticTexts["B"].tap()
        XCTAssert(app.images["tree_7_id"].exists, "Tree image was not displayed!")
    }
    
    func testLetterDisabledIfWrong() throws {
        let app = initApp()
        app.staticTexts["Q"].tap()
        XCTAssert(app.buttons["Q"].exists, "Button was not displayed!")
        XCTAssert(!app.buttons["Q"].isEnabled, "Button was not disabled!")
        
    }
    
    //Add test for all failed words
    //re-organise tests in file
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
