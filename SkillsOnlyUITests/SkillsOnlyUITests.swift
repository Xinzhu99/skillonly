//
//  SkillsOnlyUITests.swift
//  SkillsOnlyUITests
//
//  Created by Apprenant 132 on 14/03/2025.
//

import XCTest

final class SkillsOnlyUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchArguments += ["UI-Testing"]
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTalent() throws {
        // Launch app and select talent
        let talentButton = app.buttons["buttonTalent"]
        if talentButton.waitForExistence(timeout: 10) {
            talentButton.tap()
        } else {
            XCTFail("Element: \(talentButton) did not become visible in provided time.")
        }
        XCTAssert(app.navigationBars["Offers"].waitForExistence(timeout: 10))
        
        // Select an offer
        let iosOffer = app.scrollViews.otherElements.buttons["Développement iOS"]
        if iosOffer.waitForExistence(timeout: 10) {
            iosOffer.tap()
        } else {
            XCTFail("Element: \(iosOffer) did not become visible in provided time.")
        }
        
        // Postule
        let postulerButton = app.buttons["PostulerButton"]
        if postulerButton.waitForExistence(timeout: 10) {
            postulerButton.tap()
        } else {
            XCTFail("Element: \(postulerButton) did not become visible in provided time.")
        }
        XCTAssert(app.staticTexts["CandidatureSent"].waitForExistence(timeout: 10))
    }
    
    func testRecruter() throws {
        // Launch app and select recruter
        let recruterButton = app.buttons["buttonRecruteur"]
        if recruterButton.waitForExistence(timeout: 10) {
            recruterButton.tap()
        } else {
            XCTFail("Element: \(recruterButton) did not become visible in provided time.")
        }
        XCTAssert(app.navigationBars["Resumes"].waitForExistence(timeout: 10))

        // Select a resume
        let deviosResume = app.scrollViews.otherElements.buttons["Développeur iOS"]
        if deviosResume.waitForExistence(timeout: 10) {
            deviosResume.tap()
        } else {
            XCTFail("Element: \(deviosResume) did not become visible in provided time.")
        }
        
        // Contact
        let contacterButton = app.buttons["ContacterButton"]
        if contacterButton.waitForExistence(timeout: 10) {
            contacterButton.tap()
        } else {
            XCTFail("Element: \(contacterButton) did not become visible in provided time.")
        }
        XCTAssert(app.staticTexts["MessageSent"].waitForExistence(timeout: 10))
        
    }

}
