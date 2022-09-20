import DataLayer
import SwiftUI

protocol MainScreenViewModelProtocol: ObservableObject {}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    private let navigation: MainScreenNavigationProtocol
    private let repository: AppRepositoryProtocol

    init(navigation: MainScreenNavigationProtocol, repository: AppRepositoryProtocol) {
        self.navigation = navigation
        self.repository = repository
        
        Task {
            let result = try await ExchangeRateService.defaultService.getExchangeRates(payload: ExchangeRatePayloadDto(currency: .USD))
            print(result)
        }
    }
}
