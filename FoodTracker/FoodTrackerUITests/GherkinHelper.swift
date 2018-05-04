import XCTest

extension XCTest {
    
    func Given(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "Given " + text) { _ in
            step()
        }
    }
    
    func When(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "When " + text) { _ in
            step()
        }
    }
    
    func Then(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "Then " + text) { _ in
            step()
        }
    }
}
