import Utils

public struct HufExchangeRateListDto: Response {
    public var items: [HufExchangeRateItemDto]
}

public struct HufExchangeRateItemDto: Response {
    public let currency: String
    public let sellRate: String
    public let buyRate: String
}
