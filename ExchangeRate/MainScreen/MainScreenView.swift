import DataLayer
import SwiftUI

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                Task {
                    let result = try await ExchangeRateService.defaultService.getExchangeRates(payload: ExchangeRatePayloadDto(currency: .USD))
                    print(result)
                }
            }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(navigation: MainScreenNavigation(), repository: AppRepository()))
    }
}
