extension Observable {
    func flatMap<AnotherElement>(_ predicate: @escaping (Element) -> Observable<AnotherElement>) -> Observable<AnotherElement> {
        let subscribe = subscribe(observer:)
        return Observable<AnotherElement> { observer in
            var disposed = false
            var disposables = [Disposable]()
            
            let currentDisposable = subscribe(Observer(onNext: { element in
                let newObservable = predicate(element)
                var newDisposable: Disposable!
                newDisposable = newObservable.subscribe(observer: Observer(onNext: { element in
                    
                }, onError: { error in
                    
                }, onCompleted: {
                    disposables.firstIndex(where: { $0 === newDisposable! })
                }))
                disposables.append(newDisposable)
            }, onError: { error in
                observer.onError(error)
            }, onCompleted: {
                observer.onCompleted()
            }))
        }
    }
}
