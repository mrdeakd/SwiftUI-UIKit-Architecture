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
                        title: ExchangeRateLocalizable.search_bar_title(preferredLanguages: PreferredAppLanguage.current),
                        subText: "David",
                        image: ExchangeRateLocalizable.magnifyingglass(),
                        placeholder: ExchangeRateLocalizable.search_bar_placeholder(preferredLanguages: PreferredAppLanguage.current),
                        paddingSize: 12,
                        text: $viewModel.selectedCurrency,
                        onAsyncSearch: viewModel.getExchangeRateForSelectedCurrency,
                        onAsyncSubmit: viewModel.getExchangeRateForSelectedCurrency,
                        onIconTap: viewModel.goToCreatorScreen
                    )
                    .pullToRefresh(
                        pullAction: { Task { try await viewModel.getExchangeRateForSelectedCurrency() } }
                    )
                    VStack {
                        SideBoxDictionaryView(items: viewModel.exchangeRate)
                    }
                    Spacer()
                }
                .bottomView(
                    viewToShow: AnyView(CurrencyBoxListView(items: viewModel.hufExchangeRate, spaceBetweenItems: .zero))
                )
            }
        }
        .onAppear {
            Task { try await viewModel.getHufExchangeRate() }
        }
        .navigationBarHidden(true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(
            viewModel: MainScreenViewModel(
                navigation: MainScreenNavigation(),
                repository: AppRepository(),
                overlayManager: OverlayManager(appDependency: AppDependency())
            )
        )
    }
}




