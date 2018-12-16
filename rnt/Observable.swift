public struct Observable<Element> {
    public func subscribe(observer: Observer<Element>) -> Disposable? {
        return factory(observer)
    }
    
    let factory: (Observer<Element>) -> Disposable?
    
    public init(_ factory: @escaping (Observer<Element>) -> Disposable?) {
        self.factory = factory
    }
}
