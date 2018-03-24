import XCTest

/*
 * Credit: https://github.com/mvemjsun/Xcode83
 */
extension XCTest {
    
    func Given(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: #function + " " + text) { _ in
            step()
        }
    }
    
    func When(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: #function + " " + text) { _ in
            step()
        }
    }
    
    func Then(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: #function + " " + text) { _ in
            step()
        }
    }
    
    func And(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: #function + " " + text) { _ in
            step()
        }
    }
    
    func But(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: #function + " " + text) { _ in
            step()
        }
    }
}
