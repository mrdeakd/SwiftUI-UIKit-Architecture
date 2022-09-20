import NetworkingLayer

public protocol ExchangeRateServiceProtocol {
    func getExchangeRates(payload: ExchangeRatePayloadDto) async throws -> ExchangeRateListDto
}

public final class ExchangeRateService: ServiceProtocol, ExchangeRateServiceProtocol {
    var requestManager: RequestManager
    
    public static let defaultService: ExchangeRateService = {
        return ExchangeRateService(requestManager: RequestManager())
    }()
    
    public init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    public func getExchangeRates(payload: ExchangeRatePayloadDto) async throws -> ExchangeRateListDto {
        try await call(request: ExchangeRateRequest(payload: payload))
    }
}
