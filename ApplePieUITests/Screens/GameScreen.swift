//
//  GameScreen.swift
//  ApplePieUITests
//
//  Created by Volodymyr Kochergin on 21.01.21.
//

import Foundation
import XCTest

class GameScreen: BaseScreen {
    var gameStats: String { return app.staticTexts["gameStatsIdentifier"].label }
    var guessedWord: String { return app.staticTexts["guessedWordIdentifier"].label }
    var treeSeven: XCUIElement { return app.images["tree_7_id"] }
    var treeSix: XCUIElement { return app.images["tree_6_id"] }
    var treeFive: XCUIElement { return app.images["tree_5_id"] }
    var treeOne: XCUIElement { return app.images["tree_1_id"] }
    
    func enterWord(word: String) {
        for letter in word {
            let button = app.buttons[String(letter).uppercased()]
            button.tap()
        }
    }
}
