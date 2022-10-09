import SwiftUI

public struct ActivityIndicator: View {
    @State private var animate = false

    private let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    private let color = Color.lightGreen

    public init(animate: Bool = false) {
        self.animate = animate
    }

    public var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(
                    AngularGradient(gradient: .init(colors: [color]), center: .center), style: style
                )
                .rotationEffect(.degrees(animate ? 360 : 0))
            Circle()
                .trim(from: 0.5, to: 0.7)
                .stroke(
                    AngularGradient(gradient: .init(colors: [color]), center: .center), style: style
                )
                .rotationEffect(.degrees(animate ? 360 : 0))
        }.onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.animate = true
            }
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
