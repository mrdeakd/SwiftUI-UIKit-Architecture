import SwiftUI

struct MainScreenView<ViewModel: MainScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(navigation: MainScreenNavigation(), repository: AppRepository()))
    }
}
