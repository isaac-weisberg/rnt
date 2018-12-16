public extension Observable {
    public static var empty: Observable {
        return Observable { observer in
            observer.onCompleted()
            return nil
        }
    }
}
