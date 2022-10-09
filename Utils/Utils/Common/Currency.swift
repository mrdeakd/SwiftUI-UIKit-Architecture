import Foundation

public enum Currency: Codable {
    case EUR, USD, GBP, HUF, CHF, CAD, unknown

    public init(from string: String) {
        switch string.uppercased() {
        case ExchangeRateLocalizable.eur():
            self = .EUR
        case ExchangeRateLocalizable.usd():
            self = .USD
        case ExchangeRateLocalizable.gbp():
            self = .GBP
        case ExchangeRateLocalizable.huf():
            self = .HUF
        case ExchangeRateLocalizable.chf():
            self = .CHF
        case ExchangeRateLocalizable.cad():
            self = .CAD
        default:
            self = .unknown
        }
    }
}

public extension Currency {
    static var allCases: [Currency] {
        [.EUR, .USD, .GBP, .HUF, .CHF, .CAD]
    }

    var name: String {
        switch self {
        case .EUR:
            return ExchangeRateLocalizable.eur()
        case .USD:
            return ExchangeRateLocalizable.usd()
        case .GBP:
            return ExchangeRateLocalizable.gbp()
        case .HUF:
            return ExchangeRateLocalizable.huf()
        case .CHF:
            return ExchangeRateLocalizable.chf()
        case .CAD:
            return ExchangeRateLocalizable.cad()
        case .unknown:
            return ExchangeRateLocalizable.invalid_currency(preferredLanguages: PreferredAppLanguage.current)
        }
    }

    var imageName: String {
        switch self {
        case .EUR:
            return ExchangeRateLocalizable.eur().lowercased()
        case .USD:
            return ExchangeRateLocalizable.usd().lowercased()
        case .GBP:
            return ExchangeRateLocalizable.gbp().lowercased()
        case .HUF:
            return ExchangeRateLocalizable.huf().lowercased()
        case .CHF:
            return ExchangeRateLocalizable.chf().lowercased()
        case .CAD:
            return ExchangeRateLocalizable.cad().lowercased()
        case .unknown:
            return ExchangeRateLocalizable.invalid_currency(preferredLanguages: PreferredAppLanguage.current)
        }
    }
}
