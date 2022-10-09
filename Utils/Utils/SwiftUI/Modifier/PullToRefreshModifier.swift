import SwiftUI

public struct PullToRefreshModifier: ViewModifier {
    @State private var dragAmount = CGFloat.zero
    @State private var maximumOffset: CGFloat = 84

    private let backgroundColor: Color
    private let pullAction: (() -> Void)

    public init(backgroundColor: Color = .white, pullAction: @escaping (() -> Void)) {
        self.pullAction = pullAction
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        VStack {
            if dragAmount > .zero {
                HStack {
                    Spacer()
                    ActivityIndicator()
                        .padding(.vertical)
                        .frame(height: dragAmount)
                    Spacer()
                }
                .transition(.opacity)
            }
            content
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.height < maximumOffset && value.translation.height > .zero {
                                withAnimation { dragAmount = value.translation.height }
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 0.5 * maximumOffset { pullAction() }
                            withAnimation { dragAmount = .zero }
                        }
                )
        }
        .background(backgroundColor)
    }
}
