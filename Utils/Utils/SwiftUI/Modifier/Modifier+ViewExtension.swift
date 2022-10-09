import SwiftUI

public extension View {
    func pullToRefresh(pullAction: @escaping (() -> Void)) -> some View {
        modifier(PullToRefreshModifier(pullAction: pullAction))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func bottomView(viewToShow: AnyView) -> some View {
        modifier(BottomView(viewToShow: viewToShow))
    }
    
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
