import SwiftUI
import Utils

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient.appBackgroundGradient
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    UpperSearchBarView(
                        title: "Welcome back,",
                        subText: "David",
                        image: "magnifyingglass",
                        placeholder: "Try to find...",
                        paddingSize: 12,
                        text: $viewModel.selectedCurrency,
                        onAsyncSearch: viewModel.getExchangeRateForSelectedCurrency,
                        onAsyncSubmit: viewModel.getExchangeRateForSelectedCurrency
                    )
                    .pullToRefresh(
                        baseHeight: 144,
                        pullAction: { Task { try await viewModel.getExchangeRateForSelectedCurrency() } }
                    )
                    SideBoxListView(items: viewModel.exchangeRate)
                    Spacer()
                }
                .bottomView()
            }
        }
        .navigationBarHidden(true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(navigation: MainScreenNavigation(), repository: AppRepository()))
    }
}




