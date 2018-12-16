public class Disposable {
    public typealias Predicate = () -> Void
    
    public var disposed: AtomicBool = false
    
    let predicate: Predicate
    
    public func dispose() {
        if !disposed {
            predicate()
            disposed = true
        }
    }
    
    public init(predicate: @escaping Predicate) {
        self.predicate = predicate
    }
}
