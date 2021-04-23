//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/21/21.
//

import Foundation

public typealias EmptyState = State<Void>

public enum State<T> {
    case success(T)
    case loading(T?)
    case failed(err: Error, T?)

    public var data: T? {
        switch self {
        case .success(let data):
            return data
        case .loading(let data), .failed(_, let data):
            return data
        }
    }

    public var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }

    public var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }

    public var error: Error? {
        if case .failed(let err, _ ) = self {
            return err
        }
        return nil
    }

    public var hasData: Bool {
        return self.data != nil
    }

    public var asVoid: State<Void> {
        switch self {
        case .success:
            return .success(())
        case .loading:
            return .loading(nil)
        case .failed(let err, _):
            return .failed(err: err, nil)
        }
    }


    public func map<A>(transform: (T?) -> A) -> State<A> {
        let result = transform(data)

        switch self {
        case .success:
            return .success(result)
        case .loading:
            return .loading(result)
        case .failed(let err, _):
            return .failed(err: err, result)
        }
    }
}
