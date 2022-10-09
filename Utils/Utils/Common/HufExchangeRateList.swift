public struct HufExchangeRateList: Response {
    public let items: [HufExchangeRateItem]
    
    public init(items: [HufExchangeRateItem]) {
        self.items = items
    }
}

public struct HufExchangeRateItem: Response, Hashable {    
    public let currency: String
    public let sellRate: String
    public let buyRate: String
    
    public init(currency: String, sellRate: String, buyRate: String) {
        self.currency = currency
        self.sellRate = sellRate
        self.buyRate = buyRate
    }
}
