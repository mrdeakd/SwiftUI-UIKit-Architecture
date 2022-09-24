import Foundation

public enum Currency: Codable {
    case EUR, USD, GBP, HUF, CHF, CAD, Unknown

    public init(from string: String) {
        switch string.uppercased() {
        case "EUR":
            self = .EUR
        case "USD":
            self = .USD
        case "GBP":
            self = .GBP
        case "HUF":
            self = .HUF
        case "CHF":
            self = .CHF
        case "CAD":
            self = .CAD
        default:
            self = .Unknown
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
            return "EUR"
        case .USD:
            return "USD"
        case .GBP:
            return "GBP"
        case .HUF:
            return "HUF"
        case .CHF:
            return "CHF"
        case .CAD:
            return "CAD"
        case .Unknown:
            return "Not a valid Currency"
        }
    }
    
    var imageName: String {
        switch self {
        case .EUR:
            return "eur"
        case .USD:
            return "usd"
        case .GBP:
            return "gbp"
        case .HUF:
            return "huf"
        case .CHF:
            return "chf"
        case .CAD:
            return "cad"
        case .Unknown:
            return "Not a valid Currency"
        }
    }
}
