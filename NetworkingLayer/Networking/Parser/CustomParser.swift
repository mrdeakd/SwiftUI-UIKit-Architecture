import Foundation

public protocol CustomParser {
    func parse<T>(data: Data, to: T.Type) -> T
}
