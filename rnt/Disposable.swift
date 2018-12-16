class Disposable {
    typealias Predicate = () -> Void
    
    var disposed: AtomicBool = false
    
    let predicate: Predicate?
    
    func dispose() {
        if !disposed {
            predicate?()
            disposed = true
        }
    }
    
    init(predicate: Predicate?) {
        self.predicate = predicate
    }
}
