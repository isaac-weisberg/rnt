import Dispatch

extension Observable {
    func observe(on queue: DispatchQueue) -> Observable {
        let subscribe = subscribe(observer:)
        return Observable { observer in
            return subscribe(Observer(onNext: { element in
                queue.async {
                    observer.onNext(element)
                }
            }, onError: { error in
                queue.async {
                    observer.onError(error)
                }
            }, onCompleted: {
                queue.async {
                    observer.onCompleted()
                }
            }))
        }
    }
}
