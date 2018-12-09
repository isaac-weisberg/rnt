import Dispatch

extension Observable {
    func subscribe(onSync queue: DispatchQueue) -> Observable<Element> {
        let subscribe = self.subscribe(observer:)
        return Observable { observer in
            return queue.sync(execute: {
                return subscribe(observer)
            })
        }
    }
}
