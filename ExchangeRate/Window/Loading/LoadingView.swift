import SwiftUI
import Utils

public struct LoadingView: View {
    @EnvironmentObject var loadingHandler: LoadingHandler
    public init() {}

    public var body: some View {
        ZStack {
            if loadingHandler.isPresented {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.gray.opacity(0.8))
                    .transition(.opacity)
                    .edgesIgnoringSafeArea(.all)
                ActivityIndicator(animate: loadingHandler.isPresented)
                    .frame(width: 76, height: 76)
            }
        }
        .animation(.easeOut(duration: 0.3), value: loadingHandler.isPresented)
    }
}
