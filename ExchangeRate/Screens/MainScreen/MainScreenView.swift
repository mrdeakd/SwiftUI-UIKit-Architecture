import SwiftUI
import Utils

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    let itemSize: CGFloat = 126
    let spaceBetweenItems: CGFloat = 16
    let itemsToShow: CGFloat = 3
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient.appBackgroundGradient
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    inputTextField
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { value in
                            HStack(spacing: 24) {
                                ForEach(viewModel.exchangeRate.sorted(by: >), id: \.key) { key, value in
                                    exchangeRateItem(key, value)
                                }
                            }
                            .padding(.trailing, (
                                UIScreen.main.bounds.size.width
                                - ((itemsToShow - 1) * spaceBetweenItems)
                                - ((itemsToShow - 1) * itemSize)
                                - (itemSize / 2)
                                )
                            )
                            .padding(.leading, 12)
                        }
                    }
                    .padding(.horizontal)
                    .background(Color.lightGray)
                    .cornerRadius(20)
                    .offset(x: (
                        UIScreen.main.bounds.size.width
                        - ((itemsToShow - 1) * spaceBetweenItems)
                        - ((itemsToShow - 1) * itemSize)
                        - (itemSize / 2))
                    )
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func exchangeRateItem(_ key: String, _ value: Double) -> some View {
        ZStack {
            Color.white
                .cornerRadius(20)
            VStack(alignment: .center) {
                Text(key)
                    .font(.largeTitle)
                    .foregroundColor(.lightBrown)
                Text(value.twoDecimalPoints)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(.lightBrown)
            }
            .padding(.vertical)
        }
        .transition(.move(edge: .leading))
        .frame(width: itemSize, height: itemSize)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.mediumGray, lineWidth: 1)
        )
        .padding(.vertical, spaceBetweenItems)
    }
    
    var inputTextField: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Welcome back,")
                    .font(.largeTitle)
                    .foregroundColor(.lightBrown)
                Text("David").font(.title2)
                    .font(.subheadline)
                    .foregroundColor(.lightBrown)
                    .fontWeight(.thin)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .onTapGesture {
                            Task {
                                try await viewModel.getExchangeRateForSelectedCurrency()
                            }
                        }
                    TextField("Try to find...", text: $viewModel.selectedCurrency)
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
