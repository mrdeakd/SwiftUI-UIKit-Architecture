import SwiftUI

public extension View {
    func pullToRefresh(baseHeight: CGFloat, pullAction: @escaping (() -> Void)) -> some View {
        modifier(PullToRefreshModifier(baseHeight: baseHeight, pullAction: pullAction))
    }
}
