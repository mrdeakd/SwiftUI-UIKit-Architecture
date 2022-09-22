import SwiftUI

public struct PullToRefreshModifier: ViewModifier {
    @State private var dragAmount = CGFloat.zero
    @State private var maximumOffset: CGFloat = 128
    
    private let baseHeight: CGFloat
    private let pullAction: (() -> Void)
    
    public init(baseHeight: CGFloat, pullAction: @escaping (() -> Void)) {
        self.baseHeight = baseHeight
        self.pullAction = pullAction
    }

    public func body(content: Content) -> some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
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
