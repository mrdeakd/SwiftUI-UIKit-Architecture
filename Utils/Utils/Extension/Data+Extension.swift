import Foundation

extension Data {
    public func toString() -> String {
        return String(decoding: self, as: UTF8.self)
    }
}
