import Foundation

public enum Currency: Codable {
    case EUR, USD, GBP, HUF, CHF, CAD
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
