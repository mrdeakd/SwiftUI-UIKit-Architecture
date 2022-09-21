import SwiftUI

private class LocalColor {}

public extension Color {
    static let lightBrown = Color(
        UIColor(
            named: "lightBrown",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white
    )
    static let mediumGreen = Color(
        UIColor(
            named: "mediumGreen",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white)
    static let lightGreen = Color(
        UIColor(
            named: "lightGreen",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white)
    static let lightGray = Color(
        UIColor(
            named: "lightGray",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white)
    static let mediumGray = Color(
        UIColor(
            named: "mediumGray",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white)
}
