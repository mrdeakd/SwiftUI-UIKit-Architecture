public struct ExchangeRateList: Response {
    public let result: String
    public let rates: [String: Double]
    
    public init(result: String, rates: [String : Double]) {
        self.result = result
        self.rates = rates
    }
}
