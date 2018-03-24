import XCTest

enum UIState: String {
    case exist = "exists == true"
    case notExist = "exists == false"
    case hittable = "isHittable == true"
}

class Page {
    var app: XCUIApplication

    required init(_ app: XCUIApplication) {
        self.app = app
    }
    
    func on<T: Page>(page: T.Type) -> T {
        let nextPage: T
        
        // avoid duplicate initialization
        if self is T {
            nextPage = self as! T
        } else {
            nextPage = page.init(app)
        }
        
        return nextPage
    }
    
    func tap(element: XCUIElement) {
        waitFor(element: element, status: .hittable)
        element.tap()
    }
    
    func typeText(element: XCUIElement, text: String) {
        waitFor(element: element, status: .exist)
        element.typeText(text)
    }
    
    func waitFor(element: XCUIElement, status: UIState) {
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
        let result = XCTWaiter.wait(for: [expectation], timeout: 10)
        
        if(result == .timedOut) {
            XCTFail(expectation.description)
        }
    }
}
