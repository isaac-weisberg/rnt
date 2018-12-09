import Dispatch

extension Observable {
    func observe(onSync queue: DispatchQueue) -> Observable {
        let subscribe = subscribe(observer:)
        return Observable { observer in
            return subscribe(Observer(onNext: { element in
                queue.sync {
                    observer.onNext(element)
                }
            }, onError: { error in
                queue.sync {
                    observer.onError(error)
                }
            }, onCompleted: {
                queue.sync {
                    observer.onCompleted()
                }
            }))
        }
    }
}
