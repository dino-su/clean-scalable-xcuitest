import XCTest

class FoodTrackerBDDTest: XCUITestCase {
    var foodTracker: Page!
    
    func testAddMeal() {
        Given("I am in Main screen") {
            foodTracker = TestBuilder(app).setLocale().launch()
        }
        
        When("I add meal with name 'Kung Pao Chicken'") {
            foodTracker.on(page: MainPage.self).openAdd().addMeal(name: "Kung Pao Chicken")
        }
        
        Then("I see 'Kung Pao Chicken' appear in Main screen") {
            foodTracker.on(page: MainPage.self).checkHasMeal(name: "Kung Pao Chicken")
        }
    }
    
    func testDeleteMeal() {
        Given("meal 'Kung Pao Chicken' exist") {
            foodTracker = TestBuilder(app).setLocale().launch()

            foodTracker.on(page: MainPage.self).checkHasMeal(name: "Kung Pao Chicken")
        }
        
        When("I delete 'Kung Pao Chicken'") {
            foodTracker.on(page: MainPage.self).deleteMeal(name: "Kung Pao Chicken")
        }
        
        Then("'Kung Pao Chicken' dispear from main screen") {
            foodTracker.on(page: MainPage.self).checkHasMeal(name: "Kung Pao Chicken", expected: false)
        }
    }
}
