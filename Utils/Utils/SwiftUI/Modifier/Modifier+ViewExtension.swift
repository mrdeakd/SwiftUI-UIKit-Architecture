import SwiftUI

public extension View {
    func pullToRefresh(baseHeight: CGFloat, pullAction: @escaping (() -> Void)) -> some View {
        modifier(PullToRefreshModifier(baseHeight: baseHeight, pullAction: pullAction))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func bottomView() -> some View {
        modifier(BottomView())
    }
}
