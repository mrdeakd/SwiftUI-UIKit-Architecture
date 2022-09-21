import SwiftUI

extension LinearGradient {
    public static var appBackgroundGradient: LinearGradient {
        LinearGradient(gradient: Gradient(
            colors: [Color.lightGray, Color.darkGray]
        ), startPoint: .top, endPoint: .bottom)
    }
}
