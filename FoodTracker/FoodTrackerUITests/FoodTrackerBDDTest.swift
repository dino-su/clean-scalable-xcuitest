import XCTest

class FoodTrackerBDDTest: XCUITestCase {
    var foodTracker: Page!
    
    override func setUp() {
        super.setUp()
        
        foodTracker = TestBuilder(app).setLocale().launch()
    }
    
    func testAddMeal() {
        Given("I am on add meal screen") {
            foodTracker.on(page: MainPage.self).openAdd()
        }
        
        When("I add meal with name 'Kung Pao Chicken'") {
            foodTracker.on(page: AddPage.self).addMeal(name: "Kung Pao Chicken")
        }
        
        Then("I will see 'Kung Pao Chicken' appear on main screen") {
            foodTracker.on(page: MainPage.self).checkHasMeal(name: "Kung Pao Chicken")
        }
    }
    
    func testDeleteMeal() {
        Given("I am on add meal screen") { }
        
        When("I delete 'Kung Pao Chicken'") {
            foodTracker.on(page: MainPage.self).deleteMeal(name: "Kung Pao Chicken")
        }
        
        Then("'Kung Pao Chicken' will dispear from main screen") {
            foodTracker.on(page: MainPage.self).checkHasMeal(name: "Kung Pao Chicken", expected: false)
        }
    }
}
