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
        app/*@START_MENU_TOKEN@*/.staticTexts["B"]/*[[".buttons[\"B\"].staticTexts[\"B\"]",".staticTexts[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["U"]/*[[".buttons[\"U\"].staticTexts[\"U\"]",".staticTexts[\"U\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["C"]/*[[".buttons[\"C\"].staticTexts[\"C\"]",".staticTexts[\"C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["A"]/*[[".buttons[\"A\"].staticTexts[\"A\"]",".staticTexts[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["N"]/*[[".buttons[\"N\"].staticTexts[\"N\"]",".staticTexts[\"N\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["E"]/*[[".buttons[\"E\"].staticTexts[\"E\"]",".staticTexts[\"E\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["R"]/*[[".buttons[\"R\"].staticTexts[\"R\"]",".staticTexts[\"R\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
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
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
