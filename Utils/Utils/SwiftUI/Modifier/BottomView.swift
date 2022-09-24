import SwiftUI

public struct BottomView: ViewModifier {
    private let bottomViewHeight: CGFloat = 616
    private let baseOffsetY: CGFloat = UIScreen.main.bounds.size.height * 5/6
    private let baseRestOfOffsetY: CGFloat = UIScreen.main.bounds.size.height * 1/6

    @State private var offsetY: CGFloat = .zero
    @State private var fixedOffsetY: CGFloat = .zero
    @State private var opened: Bool = false
    
    private let viewToShow: AnyView
    
    public init(viewToShow: AnyView) {
        self.viewToShow = viewToShow
    }

    public func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            VStack {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 56, height: 24)
                    .foregroundColor(Color.lightGreen)
                    .padding(.vertical, 16)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear) {
                                    if opened {
                                        if abs(fixedOffsetY) + value.translation.height > bottomViewHeight - baseRestOfOffsetY {
                                            offsetY = value.translation.height
                                        }
                                    } else {
                                        if value.translation.height < bottomViewHeight - baseRestOfOffsetY {
                                            offsetY = value.translation.height
                                        }
                                    }
                                }
                            }
                            .onEnded { value in
                                withAnimation {
                                    offsetY = .zero
                                    if abs(value.translation.height) > (bottomViewHeight / 4) {
                                        if opened {
                                            fixedOffsetY = .zero
                                            opened = false
                                        } else {
                                            fixedOffsetY = baseRestOfOffsetY - bottomViewHeight
                                            opened = true
                                        }
                                    }
                                }
                            }
                    )
                if opened {
                    viewToShow
                        .frame(height: bottomViewHeight * 0.7)
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color.white)
            .cornerRadius(12, corners: [.topLeft, .topRight])
            .offset(y: baseOffsetY + fixedOffsetY)
            .offset(y: offsetY)
        }
    }
}
