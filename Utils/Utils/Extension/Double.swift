import Foundation

public extension Double {
    var twoDecimalPoints: String { String(format: "%.2f", self) }
    var asString: String { String(self) }
}
