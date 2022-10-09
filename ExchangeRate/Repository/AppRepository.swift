import Foundation
import DataLayer
import Utils

public protocol AppRepositoryProtocol {
    func getExchangeRateForSelectedCurrency(selectedCurrency: Currency) async throws -> ExchangeRateList
    func getHufExchangeRate() async throws -> HufExchangeRateList
}

public final class AppRepository: AppRepositoryProtocol {
    public func getExchangeRateForSelectedCurrency(selectedCurrency: Currency) async throws -> ExchangeRateList {
        try await ExchangeRateService.defaultService.getExchangeRates(
            payload: ExchangeRatePayloadDto(currency: selectedCurrency)
        )
    }

    public func getHufExchangeRate() async throws -> HufExchangeRateList {
        try await ExchangeRateService.defaultServiceWithTextParser.getHUFExchangeRates()
    }
}
