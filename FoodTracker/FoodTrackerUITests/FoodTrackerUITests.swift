import XCTest

class FoodTrackerUITests: XCUITestCase {
    var foodTracker: Page!
        
    override func setUp() {
        super.setUp()
        
        foodTracker = TestBuilder(app).setLocale().launch()
    }
    
    func testAddMeal() {
        foodTracker
            .on(page: MainPage.self).openAdd()
            .on(page: AddPage.self).addMeal(name: "Kung Pao Chicken").checkHasMeal(name: "Kung Pao Chicken")
    }

    func testDeleteMeal() {
        foodTracker.on(page: MainPage.self).deleteMeal(name: "Kung Pao Chicken").checkHasMeal(name: "Kung Pao Chicken", expected: false)
    }
}
