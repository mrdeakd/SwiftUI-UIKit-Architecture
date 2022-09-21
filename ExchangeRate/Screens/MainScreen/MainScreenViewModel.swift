import SwiftUI
import Combine
import Utils
import DataLayer

protocol MainScreenViewModelProtocol: ObservableObject {
    func getExchangeRateForSelectedCurrency() async throws

    var exchangeRate: [String: Double] { get }
    var selectedCurrency: String { get set }
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    private let navigation: MainScreenNavigationProtocol
    private let repository: AppRepositoryProtocol
    
    @Published var exchangeRate: [String: Double] = [:]
    @Published var selectedCurrency: String = .empty

    init(navigation: MainScreenNavigationProtocol, repository: AppRepositoryProtocol) {
        self.navigation = navigation
        self.repository = repository
    }
    
    func getExchangeRateForSelectedCurrency() async throws {
        let result = try await ExchangeRateService.defaultService.getExchangeRates(payload: ExchangeRatePayloadDto(currency: Currency(from: selectedCurrency)))
        DispatchQueue.main.async {
            self.exchangeRate = result.rates
        }
    }
}
