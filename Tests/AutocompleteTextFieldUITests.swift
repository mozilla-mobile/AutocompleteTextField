/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest

class AutocompleteTextFieldUITests: XCTestCase {
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let field = XCUIApplication().textFields["Domain"]
        field.tap()

        field.typeText("w")
        XCTAssertEqual(field.value! as! String, "www.google.com/")
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertEqual(field.value! as! String, "w")
        field.typeText("ww.yah")
        XCTAssertEqual(field.value! as! String, "www.yahoo.com/")
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertEqual(field.value! as! String, "www.yah")
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertEqual(field.value! as! String, "www.ya")
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertEqual(field.value! as! String, "")
        field.typeText("g")
        XCTAssertEqual(field.value! as! String, "google.com/")
        field.typeText("z")
        XCTAssertEqual(field.value! as! String, "gz")
        field.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertEqual(field.value! as! String, "g")
        field.typeText("o")
        XCTAssertEqual(field.value! as! String, "google.com/")
    }
}
