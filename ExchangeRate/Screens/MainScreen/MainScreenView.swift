import SwiftUI
import Utils

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.appBackgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    inputTextField
                    ForEach(viewModel.exchangeRate.sorted(by: >), id: \.key) { key, value in
                        exchangeRateItem(key, value)
                    }
                }
            }
        }
    }
    
    func exchangeRateItem(_ key: String, _ value: Double) -> some View {
        HStack {
            Text(key)
            Spacer()
            Text(value.asString)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0))
        )
        .padding(.horizontal)
    }
    
    var inputTextField: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            HStack {
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        Task {
                            try await viewModel.getExchangeRateForSelectedCurrency()
                        }
                    }
                TextField("Search", text: $viewModel.selectedCurrency)
                    .onSubmit {
                        Task {
                            try await viewModel.getExchangeRateForSelectedCurrency()
                        }
                    }
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .padding(.horizontal)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(navigation: MainScreenNavigation(), repository: AppRepository()))
    }
}
