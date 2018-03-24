import XCTest

final class AddPage: Page {
    lazy var saveButton = app.buttons["Save"].firstMatch
    lazy var textField = app.textFields.firstMatch
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        
        waitFor(element: textField, status: .hittable)
    }
    
    @discardableResult
    func addMeal(name: String) -> MainPage {
        tap(element: textField)
        typeText(element: textField, text: name + "\n")
        tap(element: saveButton)

        return MainPage(app)
    }
}
