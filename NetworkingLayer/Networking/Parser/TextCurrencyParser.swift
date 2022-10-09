import Foundation

public struct TextCurrencyParser: CustomParser {
    public init() {}

    public func parse<T>(data: Data, to: T.Type) -> T {
        var listOfCurrency = HufExchangeRateListDto(items: [])
        let str = String(decoding: data, as: UTF8.self)
        let list = str.components(separatedBy: "*")[1]
        let listOfItems = list.components(separatedBy: "|")
        for item in listOfItems {
            let parts = item.components(separatedBy: ";")
            listOfCurrency.items.append(HufExchangeRateItemDto(currency: parts[1], sellRate: parts[3], buyRate: parts[4]))
        }
        return listOfCurrency as! T
    }
}
