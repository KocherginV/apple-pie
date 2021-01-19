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
        app.buttons["B"].tap()
        app.buttons["U"].tap()
        app.buttons["C"].tap()
        app.buttons["A"].tap()
        app.buttons["N"].tap()
        app.buttons["E"].tap()
        app.buttons["R"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 1, Losses: 0, Points: 1", "Statistics was not displayed or had unexpected values!")
    }
    
    func testStatisticUpdatedAfterFail() throws {
        let app = initApp()
        app.buttons["Q"].tap()
        app.buttons["D"].tap()
        app.buttons["F"].tap()
        app.buttons["L"].tap()
        app.buttons["M"].tap()
        app.buttons["N"].tap()
        app.buttons["O"].tap()
        app.buttons["R"].tap()
        app.buttons["S"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 0, Losses: 1, Points: 0")
    }
    
    func testCanGuessAllWords() throws {
        let app = initApp()
        app.buttons["B"].tap()
        app.buttons["U"].tap()
        app.buttons["C"].tap()
        app.buttons["A"].tap()
        app.buttons["N"].tap()
        app.buttons["E"].tap()
        app.buttons["R"].tap()
        
        app.buttons["G"].tap()
        app.buttons["L"].tap()
        app.buttons["O"].tap()
        app.buttons["R"].tap()
        app.buttons["I"].tap()
        app.buttons["U"].tap()
        app.buttons["S"].tap()
        
        app.buttons["S"].tap()
        app.buttons["W"].tap()
        app.buttons["I"].tap()
        app.buttons["F"].tap()
        app.buttons["T"].tap()
        
        app.buttons["I"].tap()
        app.buttons["N"].tap()
        app.buttons["C"].tap()
        app.buttons["A"].tap()
        app.buttons["D"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        app.buttons["C"].tap()
        app.buttons["T"].tap()
        
        app.buttons["P"].tap()
        app.buttons["R"].tap()
        app.buttons["O"].tap()
        app.buttons["G"].tap()
        app.buttons["A"].tap()
        app.buttons["M"].tap()
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 5, Losses: 0, Points: 5")
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "p r o g r a m")
    }
    
    func testPictureUpdatedAfterWrongLetter() throws {
        let app = initApp()
        app.buttons["Q"].tap()
        XCTAssert(app.images["tree_6_id"].exists, "Tree image was not displayed!")
        app.buttons["F"].tap()
        XCTAssert(app.images["tree_5_id"].exists, "Tree image was not displayed!")
    }
    
    func testLabelUpdatedAfterCorrectLetter() throws {
        let app = initApp()
        app.buttons["B"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "b _ _ _ _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testLabelUpdatedAfterMultipleCorrectLetters() throws {
        let app = initApp()
        app.buttons["C"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "_ _ c c _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testImageIsNotUpdatedAfterCorrectLetter() throws {
        let app = initApp()
        app.buttons["B"].tap()
        XCTAssert(app.images["tree_7_id"].exists, "Tree image was not displayed!")
    }
    
    func testLetterDisabledIfWrong() throws {
        let app = initApp()
        app.buttons["Q"].tap()
        XCTAssert(app.buttons["Q"].exists, "Button was not displayed!")
        XCTAssert(!app.buttons["Q"].isEnabled, "Button was not disabled!")
    }
    
    func testFailGame() throws {
        let app = initApp()
        app.buttons["Q"].tap()
        app.buttons["D"].tap()
        app.buttons["F"].tap()
        app.buttons["L"].tap()
        app.buttons["M"].tap()
        app.buttons["N"].tap()
        app.buttons["O"].tap()
        app.buttons["R"].tap()
        app.buttons["S"].tap()
        
        app.buttons["P"].tap()
        app.buttons["W"].tap()
        app.buttons["M"].tap()
        app.buttons["Q"].tap()
        app.buttons["J"].tap()
        app.buttons["D"].tap()
        app.buttons["K"].tap()
        app.buttons["A"].tap()
        
        app.buttons["A"].tap()
        app.buttons["B"].tap()
        app.buttons["C"].tap()
        app.buttons["D"].tap()
        app.buttons["E"].tap()
        app.buttons["Q"].tap()
        
        app.buttons["B"].tap()
        app.buttons["F"].tap()
        app.buttons["G"].tap()
        app.buttons["H"].tap()
        app.buttons["I"].tap()
        app.buttons["J"].tap()
        app.buttons["X"].tap()
        app.buttons["Y"].tap()
        app.buttons["Z"].tap()
        
        app.buttons["Z"].tap()
        app.buttons["X"].tap()
        app.buttons["Y"].tap()
        app.buttons["S"].tap()
        app.buttons["T"].tap()
        app.buttons["U"].tap()
        app.buttons["V"].tap()
        
        app.buttons["Z"].tap()
        app.buttons["X"].tap()
        app.buttons["Y"].tap()
        app.buttons["S"].tap()
        app.buttons["T"].tap()
        app.buttons["U"].tap()
        app.buttons["V"].tap()
        XCTAssert(app.images["tree_1_id"].exists, "Tree image was not displayed!")
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "_ _ _ _ _ _ _", "Incorrect placeholder was displayed!")
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 0, Losses: 4, Points: 0", "Incorrect statistic was displayed!")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
