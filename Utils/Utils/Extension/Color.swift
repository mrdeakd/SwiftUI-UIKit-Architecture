import SwiftUI

private class LocalColor {}

public extension Color {
    static let lightGray = Color(
        UIColor(
            named: "lightGray",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white
    )
    static let darkGray = Color(
        UIColor(
            named: "darkGray",
            in: Bundle(for: LocalColor.self),
            compatibleWith: nil
        ) ?? .white)
}
