import NetworkingLayer
import Utils

public protocol ExchangeRateServiceProtocol {
    func getExchangeRates(payload: ExchangeRatePayloadDto) async throws -> ExchangeRateList
}

public final class ExchangeRateService: ServiceProtocol, ExchangeRateServiceProtocol {
    var requestManager: RequestManager

    public static let defaultService: ExchangeRateService = {
        return ExchangeRateService(requestManager: RequestManager())
    }()

    public static let defaultServiceWithTextParser: ExchangeRateService = {
        return ExchangeRateService(requestManager: RequestManager(parser: TextCurrencyParser()))
    }()

    public init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }

    public func getExchangeRates(payload: ExchangeRatePayloadDto) async throws -> ExchangeRateList {
        try await CurrencyMapper.convert(call(request: ExchangeRateRequest(payload: payload)))
    }

    public func getHUFExchangeRates() async throws -> HufExchangeRateList {
        try await CurrencyMapper.convert(call(request: HufExchangeRateRequest()))
    }
}
