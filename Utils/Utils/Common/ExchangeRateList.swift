public struct ExchangeRateList: Response {
    public let result: String
    public let rates: [String: Double]

    public init(result: String, rates: [String: Double]) {
        self.result = result
        self.rates = rates
    }
}

extension ExchangeRateList {
    public static let mock = ExchangeRateList(
        result: "success",
        rates: [
            "HUF": 1.0,
            "EUR": 2.0,
            "USD": 3.0
        ]
    )
}
