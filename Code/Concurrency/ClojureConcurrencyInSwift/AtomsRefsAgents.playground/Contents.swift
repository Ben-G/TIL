//: Playground - noun: a place where people can play

import Cocoa

public protocol AtomicProtocol: class {
    associatedtype Value

    @discardableResult
    func withValue<ResultValue>(_ action: (Value) throws -> ResultValue) rethrows -> ResultValue

    @discardableResult
    func modify<ResultValue>(_ action: (inout Value) throws -> ResultValue) rethrows -> ResultValue
}

final class PosixThreadMutex: NSLocking {
    private var mutex = pthread_mutex_t()

    init() {
        let result = pthread_mutex_init(&self.mutex, nil)
        precondition(result == 0, "Failed to initialize mutex with error \(result).")
    }

    deinit {
        let result = pthread_mutex_destroy(&self.mutex)
        precondition(result == 0, "Failed to destroy mutex with error \(result).")
    }

    func lock() {
        let result = pthread_mutex_lock(&self.mutex)
        precondition(result == 0, "Failed to lock \(self) with error \(result).")
    }

    func unlock() {
        let result = pthread_mutex_unlock(&self.mutex)
        precondition(result == 0, "Failed to unlock \(self) with error \(result).")
    }
}

/// An atomic variable.
public final class AtomicBox<Value>: AtomicProtocol {
    private let lock: PosixThreadMutex
    private var _value: Value

    /// Initialize the variable with the given initial value.
    ///
    /// - parameters:
    ///   - value: Initial value for `self`.
    public init(_ value: Value) {
        _value = value
        lock = PosixThreadMutex()
    }

    /// Atomically modifies the variable.
    ///
    /// - parameters:
    ///   - action: A closure that takes the current value.
    ///
    /// - returns: The result of the action.
    @discardableResult
    public func modify<Result>(_ action: (inout Value) throws -> Result) rethrows -> Result {
        lock.lock()
        defer { lock.unlock() }

        return try action(&_value)
    }

    /// Atomically perform an arbitrary action using the current value of the
    /// variable.
    ///
    /// - parameters:
    ///   - action: A closure that takes the current value.
    ///
    /// - returns: The result of the action.
    @discardableResult
    public func withValue<Result>(_ action: (Value) throws -> Result) rethrows -> Result {
        lock.lock()
        defer { lock.unlock() }
        return try action(_value)
    }
}

let box = AtomicBox<Int>(1)
box.modify { value in
    value += 1
}

box.withValue { value in
    print(value)
}

