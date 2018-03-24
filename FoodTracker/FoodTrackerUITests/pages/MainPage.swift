import XCTest

final class MainPage: Page {
    lazy var addButton = app.buttons["Add"].firstMatch
    lazy var deleteButton = app.buttons["Delete"].firstMatch
    lazy var title = app.navigationBars["Your Meals"].firstMatch
    lazy var meals = app.tables.cells.staticTexts

    required init(_ app: XCUIApplication) {
        super.init(app)
        
        waitFor(element: title, status: .exist)
    }
    
    func checkHasMeal(name: String, expected: Bool = true ) {
        let meal = meals[name].firstMatch
        
        switch expected {
        case true:
            XCTAssertEqual(meal.label, name)
        case false:
            waitFor(element: meal, status: .notExist)
        }
    }
    
    @discardableResult
    func deleteMeal(name: String) -> Self {
        let meal = meals[name].firstMatch
        meal.swipeLeft()
        tap(element: deleteButton)
        
        return self
    }
    
    @discardableResult
    func openAdd() -> AddPage {
        tap(element: addButton)

        return AddPage(app)
    }
}
