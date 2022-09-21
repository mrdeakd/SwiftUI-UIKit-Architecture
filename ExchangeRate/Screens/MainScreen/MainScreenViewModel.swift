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

        let filterKnownAndSelectedCurrency = filterKnownAndSelectedCurrency(items: result.rates)
        
        let inverseLessThanZeroValue = inverseLessThanZeroValue(items: filterKnownAndSelectedCurrency)

        DispatchQueue.main.async {
            self.exchangeRate = inverseLessThanZeroValue
        }
    }
    
    func filterKnownAndSelectedCurrency(items: [String: Double]) -> [String: Double] {
        items.filter {
            Currency.allCases.contains(Currency(from: $0.key)) &&
            $0.key.uppercased() != selectedCurrency.uppercased()
        }
    }
    
    func inverseLessThanZeroValue(items: [String: Double]) -> [String: Double] {
        Dictionary(
            uniqueKeysWithValues: items.map { key, value in
                if value < 1 {
                    return (key, 1 / value)
                } else {
                    return (key, value)
                }
            })
    }
}
