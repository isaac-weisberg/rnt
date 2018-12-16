extension Observable {
    func map<AnotherElement>(_ predicate: @escaping (Element) throws -> AnotherElement) -> Observable<AnotherElement> {
        let subscribe = self.subscribe(observer:)
        return Observable<AnotherElement> { observer in
            return subscribe(Observer(onNext: { element in
                let value: AnotherElement
                do {
                    value = try predicate(element)
                } catch {
                    observer.onError(error)
                    return
                }
                observer.onNext(value)
            }, onError: observer.onError, onCompleted: observer.onCompleted))
        }
    }
}
