import Dispatch

extension Observable {
    func subscribe(on queue: DispatchQueue) -> Observable<Element> {
        let subscribe = self.subscribe(observer:)
        return Observable { observer in
            var nestedDisposable: Disposable?
            let disposable = Disposable {
                nestedDisposable?.dispose()
            }
            
            queue.async {
                let resultingDisposable = subscribe(observer)
                if disposable.disposed {
                    resultingDisposable?.dispose()
                } else {
                    nestedDisposable = resultingDisposable
                }
            }
            
            return disposable
        }
    }
}
