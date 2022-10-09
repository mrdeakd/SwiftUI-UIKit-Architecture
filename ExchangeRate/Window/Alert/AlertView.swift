import SwiftUI

public struct AlertView: View {
    @EnvironmentObject var handler: AlertHandler

    public init() { }

    public var body: some View {
        VStack {
            if let alert = handler.nextAlert {
                InfoItemView(title: alert.title, message: alert.message, didFinish: alert.didFinish)
                    .transition(.opacity)
            }
            Spacer()
        }
        .animation(.easeInOut, value: handler.nextAlert)
        .padding()
    }
}
