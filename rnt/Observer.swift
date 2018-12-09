struct Observer<Element> {
    let onNext: (Element) -> Void
    
    let onError: (Error) -> Void
    
    let onCompleted: () -> Void
    
    init(onNext: @escaping (Element) -> Void, onError: @escaping (Error) -> Void, onCompleted: @escaping () -> Void) {
        self.onNext = onNext
        self.onError = onError
        self.onCompleted = onCompleted
    }
}
