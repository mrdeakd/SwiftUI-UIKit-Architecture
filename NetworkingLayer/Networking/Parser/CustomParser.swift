import Foundation

public protocol CustomParser {
    func parse<T>(data: Data, into: T.Type) -> T?
}
