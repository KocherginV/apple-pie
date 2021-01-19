//
//  ApplePieUITests.swift
//  ApplePieUITests
//
//  Created by Volodymyr Kochergin on 13.01.21.
//

import XCTest

class ApplePieUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func enterWord(word: String) {
        for letter in word {
            let button = app.buttons[String(letter).uppercased()]
            button.tap()
        }
    }
    
    func testStatisticUpdatedAfterGuess() throws {
        enterWord(word: "buccaneer")
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 1, Losses: 0, Points: 1", "Statistics was not displayed or had unexpected values!")
    }
    
    func testStatisticUpdatedAfterFail() throws {
        enterWord(word: "qdflmnors")
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 0, Losses: 1, Points: 0")
    }
    
    func testCanGuessAllWords() throws {
        enterWord(word: "buccaneer")
        enterWord(word: "glorious")
        enterWord(word: "swift")
        enterWord(word: "incadescent")
        enterWord(word: "program")
        XCTAssert(app.staticTexts["gameStatsIdentifier"].label as String? == "Wins: 5, Losses: 0, Points: 5")
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "p r o g r a m")
    }
    
    func testPictureUpdatedAfterWrongLetter() throws {
        app.buttons["Q"].tap()
        XCTAssert(app.images["tree_6_id"].exists, "Tree image was not displayed!")
        app.buttons["F"].tap()
        XCTAssert(app.images["tree_5_id"].exists, "Tree image was not displayed!")
    }
    
    func testLabelUpdatedAfterCorrectLetter() throws {
        app.buttons["B"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "b _ _ _ _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testLabelUpdatedAfterMultipleCorrectLetters() throws {
        app.buttons["C"].tap()
        XCTAssert(app.staticTexts["guessedWordIdentifier"].label as String? == "_ _ c c _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testImageIsNotUpdatedAfterCorrectLetter() throws {
        app.buttons["B"].tap()
        XCTAssert(app.images["tree_7_id"].exists, "Tree image was not displayed!")
    }
    
    func testLetterDisabledIfWrong() throws {
        app.buttons["Q"].tap()
        XCTAssert(app.buttons["Q"].exists, "Button was not displayed!")
        XCTAssert(!app.buttons["Q"].isEnabled, "Button was not disabled!")
    }
    
    func testFailGame() throws {
        enterWord(word: "qdflmnors")
        enterWord(word: "pwmqjdka")
        enterWord(word: "abcdeq")
        enterWord(word: "bfghijxyz")
        enterWord(word: "zxystuv")
        enterWord(word: "zxystuv")
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
