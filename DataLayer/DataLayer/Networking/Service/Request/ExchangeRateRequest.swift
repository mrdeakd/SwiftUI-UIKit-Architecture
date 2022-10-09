import Foundation
import NetworkingLayer
import Utils

public final class ExchangeRateRequest: RequestProtocol {
    public var path: String
    public var requestType: NetworkingLayer.RequestType = .GET

    public typealias ApiResponse = ExchangeRateListDto

    private let currency: Currency

    public init(payload: ExchangeRatePayloadDto) {
        self.currency = payload.currency
        self.path = "/" + currency.name
    }
}

public struct ExchangeRatePayloadDto: Codable {
    public let currency: Currency

    public init(currency: Currency) {
        self.currency = currency
    }
}
