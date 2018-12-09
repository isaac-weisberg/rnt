struct Observable<Element> {
    func subscribe(observer: Observer<Element>) -> Disposable {
        return factory(observer)
    }
    
    let factory: (Observer<Element>) -> Disposable
    
    init(_ factory: @escaping (Observer<Element>) -> Disposable) {
        self.factory = factory
    }
}
