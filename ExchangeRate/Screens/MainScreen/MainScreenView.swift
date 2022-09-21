import SwiftUI
import Utils

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @Namespace var firstItemID
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient.appBackgroundGradient
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    inputTextField
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { value in
                            HStack {
                                ForEach(viewModel.exchangeRate.sorted(by: >), id: \.key) { key, value in
                                    exchangeRateItem(key, value)
                                }
                                .id(firstItemID)
                                .onChange(of: viewModel.exchangeRate) { _ in
                                    withAnimation {
                                        value.scrollTo(firstItemID)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func exchangeRateItem(_ key: String, _ value: Double) -> some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            VStack(alignment: .center) {
                Text(key)
                    .font(.largeTitle)
                    .foregroundColor(.darkGray)
                Text(value.twoDecimalPoints)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(.darkGray)
            }
            .padding(.vertical)
        }
        .transition(.move(edge: .leading))
        .frame(width: 126, height: 126)
        .padding(.leading)
    }
    
    var inputTextField: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Welcome back,")
                    .font(.largeTitle)
                    .foregroundColor(.darkGray)
                Text("David").font(.title2)
                    .font(.subheadline)
                    .foregroundColor(.darkGray)
                    .fontWeight(.thin)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .onTapGesture {
                            Task {
                                try await viewModel.getExchangeRateForSelectedCurrency()
                            }
                        }
                    TextField("Search", text: $viewModel.selectedCurrency)
                        .textInputAutocapitalization(.characters)
                        .onSubmit {
                            Task {
                                try await viewModel.getExchangeRateForSelectedCurrency()
                            }
                        }
                }
                .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
        }
        .frame(height: 144)
        .padding(.bottom)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(navigation: MainScreenNavigation(), repository: AppRepository()))
    }
}
