import SwiftUI
import Utils

struct CreatorScreenView<ViewModel: CreatorScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text(ExchangeRateLocalizable.app_name(preferredLanguages: PreferredAppLanguage.current))
                .font(.system(size: 36, weight: .bold, design: .serif))
            Image(systemName: ExchangeRateLocalizable.memorychip())
                .resizable()
                .frame(width: 256, height: 256)
                .foregroundStyle(
                    Color.lightGreen.gradient.shadow(
                        .inner(color: .black, radius: 10, x: viewModel.xLocation * -20, y: viewModel.yLocation * -20)
                    )
                )
                .rotation3DEffect(.degrees(viewModel.xLocation * 20), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(viewModel.yLocation * 20), axis: (x: -1, y: 0, z: 0))
                .onTapGesture(perform: viewModel.closeScreen)
                .padding()
            Text(ExchangeRateLocalizable.creator_copyright(preferredLanguages: PreferredAppLanguage.current))
        }
    }
}
