import SwiftUI
import Combine
import Utils

protocol MainScreenViewModelProtocol: ObservableObject {
    func getExchangeRateForSelectedCurrency() async throws
    func getHufExchangeRate() async throws
    func goToCreatorScreen()

    var exchangeRate: [String: Double] { get }
    var hufExchangeRate: [HufExchangeRateItem] { get }
    var selectedCurrency: String { get set }
}

final class MainScreenViewModel: MainScreenViewModelProtocol {
    private let navigation: MainScreenNavigationProtocol
    private let repository: AppRepositoryProtocol
    private let overlayManager: OverlayManagerProtocol

    @Published var exchangeRate: [String: Double] = [:]
    @Published var hufExchangeRate: [HufExchangeRateItem] = []
    @Published var selectedCurrency: String = .empty

    init(
        navigation: MainScreenNavigationProtocol,
        repository: AppRepositoryProtocol,
        overlayManager: OverlayManagerProtocol
    ) {
        self.navigation = navigation
        self.repository = repository
        self.overlayManager = overlayManager
    }

    func getExchangeRateForSelectedCurrency() async throws {
        await overlayManager.asyncRequestWithLoading(
            request: try await repository.getExchangeRateForSelectedCurrency(
                selectedCurrency: Currency(from: selectedCurrency)
            ),
            onLoaded: { result in
                let filterKnownAndSelectedCurrency = self.filterKnownAndSelectedCurrency(items: result.rates)
                let inverseLessThanZeroValue = self.inverseLessThanZeroValue(items: filterKnownAndSelectedCurrency)
                DispatchQueue.main.async { self.exchangeRate = inverseLessThanZeroValue }
            }
        )
    }

    func getHufExchangeRate() async throws {
        await overlayManager.asyncRequestWithLoading(
            request: try await repository.getHufExchangeRate(),
            onLoaded: { result in
                let filtered = result.items.filter { Currency.allCases.contains(Currency(from: $0.currency)) }
                DispatchQueue.main.async { self.hufExchangeRate = filtered }
            })
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

    func goToCreatorScreen() {
        navigation.onGoToCreatorScreen?()
    }
}
