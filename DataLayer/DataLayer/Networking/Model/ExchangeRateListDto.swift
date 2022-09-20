import NetworkingLayer

public struct ExchangeRateListDto: Response {
    public let result: String
    public let rates: [String: Double]
}
