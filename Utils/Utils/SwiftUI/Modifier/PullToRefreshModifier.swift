import SwiftUI

public struct PullToRefreshModifier: ViewModifier {
    @State private var dragAmount = CGFloat.zero
    @State private var maximumOffset: CGFloat = 84
    
    private let baseHeight: CGFloat
    private let backgroundColor: Color
    private let pullAction: (() -> Void)
    
    public init(baseHeight: CGFloat, backgroundColor: Color = .white, pullAction: @escaping (() -> Void)) {
        self.baseHeight = baseHeight
        self.pullAction = pullAction
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        ZStack {
            backgroundColor
                .cornerRadius(20)
                .edgesIgnoringSafeArea(.top)
            VStack {
                if dragAmount > .zero {
                    HStack {
                        Spacer()
                        ActivityIndicator()
                            .padding(.top)
                            .frame(height: dragAmount)
                        Spacer()
                    }
                    .transition(.opacity)
                }
                content
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.height < maximumOffset {
                                    withAnimation { dragAmount = value.translation.height }
                                }
                            }
                            .onEnded { value in
                                if value.translation.height > 0.5 * maximumOffset { pullAction() }
                                withAnimation { dragAmount = .zero }
                            }
                    )
            }
        }
        .frame(height: baseHeight + dragAmount)
    }
}
