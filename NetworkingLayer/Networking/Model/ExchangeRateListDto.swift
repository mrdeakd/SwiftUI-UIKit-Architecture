import Utils

public struct ExchangeRateListDto: Response {
    public let result: String
    public let rates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result
        case rates = "conversion_rates"
    }
}
