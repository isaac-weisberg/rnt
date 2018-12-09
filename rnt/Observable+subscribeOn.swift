import Dispatch

extension Observable {
    func subscribe(on queue: DispatchQueue) -> Observable<Element> {
        let subscribe = self.subscribe(observer:)
        return Observable { observer in
            /*
             Here, the disposed boolean should be atomic :P
             Current implementation assumes it is
             */
            var disposed = false
            var disposable: Disposable?
            
            queue.async {
                let resultingDisposable = subscribe(observer)
                if disposed { // Remember, it's atomic
                    resultingDisposable()
                } else {
                    disposable = resultingDisposable
                }
            }
            
            return {
                disposable?()
                disposed = true
            }
        }
    }
}
