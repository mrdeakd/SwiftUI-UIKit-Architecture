import Foundation
import NetworkingLayer
import Utils

enum CurrencyMapper {
    static func convert(_ hufExchangeRateListDto: HufExchangeRateListDto) -> HufExchangeRateList {
        var items = [HufExchangeRateItem]()
        for item in hufExchangeRateListDto.items {
            items.append(HufExchangeRateItem(currency: item.currency, sellRate: item.sellRate, buyRate: item.buyRate))
        }
        return HufExchangeRateList(items: items)
    }
    
    static func convert(_ exchangeRateListDto: ExchangeRateListDto) -> ExchangeRateList {
        ExchangeRateList(result: exchangeRateListDto.result, rates: exchangeRateListDto.rates)
    }
}
