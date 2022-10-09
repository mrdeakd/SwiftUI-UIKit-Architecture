import Foundation
import NetworkingLayer

public final class HufExchangeRateRequest: RequestProtocol {
    public var host: String
    public var path: String
    public var requestType: NetworkingLayer.RequestType = .GET

    public typealias ApiResponse = HufExchangeRateListDto

    public init() {
        self.host = APIConstants.hufCurrencyExchanges
        self.path = .empty
    }
}
