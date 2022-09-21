import SwiftUI

extension LinearGradient {
    public static var appBackgroundGradient: LinearGradient {
        LinearGradient(gradient: Gradient(
            colors: [Color.lightGreen, Color.mediumGreen]
        ), startPoint: .top, endPoint: .bottom)
    }
}
