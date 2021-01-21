//
//  ApplePieUITests.swift
//  ApplePieUITests
//
//  Created by Volodymyr Kochergin on 13.01.21.
//

import XCTest

class ApplePieUITests: BaseTest {
    
    let gameScreen = GameScreen()
    
    
    func testStatisticUpdatedAfterGuess() throws {
        gameScreen.enterWord(word: "buccaneer")
        XCTAssert(gameScreen.gameStats as String? == "Wins: 1, Losses: 0, Points: 1", "Statistics was not displayed or had unexpected values!")
    }
    
    func testStatisticUpdatedAfterFail() throws {
        gameScreen.enterWord(word: "qdflmnors")
        XCTAssert(gameScreen.gameStats as String? == "Wins: 0, Losses: 1, Points: 0")
    }
    
    func testCanGuessAllWords() throws {
        gameScreen.enterWord(word: "buccaneer")
        gameScreen.enterWord(word: "glorious")
        gameScreen.enterWord(word: "swift")
        gameScreen.enterWord(word: "incadescent")
        gameScreen.enterWord(word: "program")
        XCTAssert(gameScreen.gameStats as String? == "Wins: 5, Losses: 0, Points: 5")
        XCTAssert(gameScreen.guessedWord as String? == "p r o g r a m")
    }
    
    func testPictureUpdatedAfterWrongLetter() throws {
        app.buttons["Q"].tap()
        XCTAssert(gameScreen.treeSix.exists, "Tree image was not displayed!")
        app.buttons["F"].tap()
        XCTAssert(gameScreen.treeFive.exists, "Tree image was not displayed!")
    }
    
    func testLabelUpdatedAfterCorrectLetter() throws {
        app.buttons["B"].tap()
        XCTAssert(gameScreen.guessedWord as String? == "b _ _ _ _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testLabelUpdatedAfterMultipleCorrectLetters() throws {
        app.buttons["C"].tap()
        XCTAssert(gameScreen.guessedWord as String? == "_ _ c c _ _ _ _ _",
                  "Label was not updated properly after guessed word!")
    }
    
    func testImageIsNotUpdatedAfterCorrectLetter() throws {
        app.buttons["B"].tap()
        XCTAssert(gameScreen.treeSeven.exists, "Tree image was not displayed!")
    }
    
    func testLetterDisabledIfWrong() throws {
        app.buttons["Q"].tap()
        XCTAssert(app.buttons["Q"].exists, "Button was not displayed!")
        XCTAssert(!app.buttons["Q"].isEnabled, "Button was not disabled!")
    }
    
    func testFailGame() throws {
        gameScreen.enterWord(word: "qdflmnors")
        gameScreen.enterWord(word: "pwmqjdka")
        gameScreen.enterWord(word: "abcdeq")
        gameScreen.enterWord(word: "bfghijxyz")
        gameScreen.enterWord(word: "zxystuv")
        gameScreen.enterWord(word: "zxystuv")
        XCTAssert(gameScreen.treeOne.exists, "Tree image was not displayed!")
        XCTAssert(gameScreen.guessedWord as String? == "_ _ _ _ _ _ _", "Incorrect placeholder was displayed!")
        XCTAssert(gameScreen.gameStats as String? == "Wins: 0, Losses: 4, Points: 0", "Incorrect statistic was displayed!")
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
