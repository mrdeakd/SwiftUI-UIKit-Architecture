import SwiftUI

public extension Color {
    static let lightBrown = Color(
        UIColor(
            named: "lightBrown",
            in: Bundle(for: LocalBundle.self),
            compatibleWith: nil
        ) ?? .white
    )
    static let mediumGreen = Color(
        UIColor(
            named: "mediumGreen",
            in: Bundle(for: LocalBundle.self),
            compatibleWith: nil
        ) ?? .white)
    static let lightGreen = Color(
        UIColor(
            named: "lightGreen",
            in: Bundle(for: LocalBundle.self),
            compatibleWith: nil
        ) ?? .white)
    static let lightGray = Color(
        UIColor(
            named: "lightGray",
            in: Bundle(for: LocalBundle.self),
            compatibleWith: nil
        ) ?? .white)
    static let mediumGray = Color(
        UIColor(
            named: "mediumGray",
            in: Bundle(for: LocalBundle.self),
            compatibleWith: nil
        ) ?? .white)
}
