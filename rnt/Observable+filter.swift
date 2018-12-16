extension Observable {
    func filter(_ predicate: @escaping (Element) -> Bool) -> Observable<Element> {
        let subscribe = self.subscribe(observer:)
        return Observable { observer in
            return subscribe(Observer(onNext: { element in
                if predicate(element) {
                    observer.onNext(element)
                }
            }, onError: observer.onError, onCompleted: observer.onCompleted))
        }
    }
}
