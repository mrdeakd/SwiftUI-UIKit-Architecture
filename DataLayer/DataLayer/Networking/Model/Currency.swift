import Foundation

public enum Currency: Codable {
    case EUR, USD, GBP, HUF, CHF, CAD
    
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
            self = .HUF
        }
    }
}

public extension Currency {
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
        }
    }
}
