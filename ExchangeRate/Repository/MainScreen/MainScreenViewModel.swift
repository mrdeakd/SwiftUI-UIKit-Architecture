import SwiftUI
import Combine
import Utils

protocol MainScreenViewModelProtocol: ObservableObject {
    func getExchangeRateForSelectedCurrency() async throws
    func getHufExchangeRate() async throws

    var exchangeRate: [String: Double] { get }
    var hufExchangeRate: [HufExchangeRateItem] { get }
    var selectedCurrency: String { get set }
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    private let navigation: MainScreenNavigationProtocol
    private let repository: AppRepositoryProtocol

    @Published var exchangeRate: [String: Double] = [:]
    @Published var hufExchangeRate: [HufExchangeRateItem] = []

    @Published var selectedCurrency: String = .empty

    init(navigation: MainScreenNavigationProtocol, repository: AppRepositoryProtocol) {
        self.navigation = navigation
        self.repository = repository
    }

    func getExchangeRateForSelectedCurrency() async throws {
        let result = try await repository.getExchangeRateForSelectedCurrency(
            selectedCurrency: Currency(from: selectedCurrency)
        )

        let filterKnownAndSelectedCurrency = filterKnownAndSelectedCurrency(items: result.rates)

        let inverseLessThanZeroValue = inverseLessThanZeroValue(items: filterKnownAndSelectedCurrency)

        DispatchQueue.main.async {
            self.exchangeRate = inverseLessThanZeroValue
        }
    }

    func getHufExchangeRate() async throws {
        let result = try await repository.getHufExchangeRate()

        let filtered = result.items.filter {
            Currency.allCases.contains(Currency(from: $0.currency))
        }

        DispatchQueue.main.async {
            self.hufExchangeRate = filtered
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
