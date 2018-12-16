@testable import rnt_macos
import XCTest

class SynchSubs: XCTestCase {
    func testBasicEmptySub() {
        let observable = Observable<Int>.empty
        var completed: AtomicBool = false
        
        let observer = Observer<Int>(onNext: { el in
            XCTFail("Expected to never emit anything")
        }, onError: { error in
            XCTFail("Expected to never fail")
        }, onCompleted: {
            completed = true
        })
        
        let disposable = observable.subscribe(observer: observer)
        XCTAssert(disposable == nil, "Should be uncancelable")
        XCTAssert(completed, "Since this is a synchronous observable, it should be already over by that moment.")
    }
}
