public struct Observer<Element> {
    let onNext: (Element) -> Void
    
    let onError: (Error) -> Void
    
    let onCompleted: () -> Void
    
    public init(onNext: @escaping (Element) -> Void = { _ in }, onError: @escaping (Error) -> Void = { _ in }, onCompleted: @escaping () -> Void = { }) {
        self.onNext = onNext
        self.onError = onError
        self.onCompleted = onCompleted
    }
}
