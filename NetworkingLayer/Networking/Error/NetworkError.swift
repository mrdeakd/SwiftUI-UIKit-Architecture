import Utils

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
    case notFound
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString(
                ExchangeRateLocalizable.network_error_invalid_url(preferredLanguages: PreferredAppLanguage.current),
                comment: ExchangeRateLocalizable.network_error_invalid_url_comment(preferredLanguages: PreferredAppLanguage.current)
            )
        case .invalidServerResponse:
            return NSLocalizedString(
                ExchangeRateLocalizable.network_error_invalid_server_response(preferredLanguages: PreferredAppLanguage.current),
                comment: ExchangeRateLocalizable.network_error_invalid_server_response_comment(preferredLanguages: PreferredAppLanguage.current)
            )
        case .notFound:
            return NSLocalizedString(
                ExchangeRateLocalizable.network_error_not_found(preferredLanguages: PreferredAppLanguage.current),
                comment: ExchangeRateLocalizable.network_error_not_found_comment(preferredLanguages: PreferredAppLanguage.current)
            )
        }
    }
}
