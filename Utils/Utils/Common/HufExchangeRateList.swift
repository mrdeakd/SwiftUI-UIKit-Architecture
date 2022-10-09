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

extension HufExchangeRateItem {
    public static let mockList = [
        HufExchangeRateItem(currency: "HUF", sellRate: "1.0", buyRate: "2.0"),
        HufExchangeRateItem(currency: "EUR", sellRate: "3.0", buyRate: "4.0"),
        HufExchangeRateItem(currency: "USD", sellRate: "5.0", buyRate: "6.0")
    ]
}

extension HufExchangeRateList {
    public static let mock = HufExchangeRateList(items: HufExchangeRateItem.mockList)
}
