public enum Logging {
    public struct Category: RawRepresentable, Hashable, Codable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public static let network = Category(rawValue: "network")
    }

    public enum Level: String, Codable, CaseIterable {
        case debug
        case info
        case error
        case critical

        var icon: String {
            switch self {
            case .debug: return "🔷"
            case .info: return "🔶"
            case .error: return "🚫"
            case .critical: return "❌"
            }
        }
    }
}
