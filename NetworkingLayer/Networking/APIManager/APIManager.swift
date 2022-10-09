import Utils

public class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func perform(_ request: any RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        
        ExchangeLogger.shared.info(data.toString(), category: .network)
        ExchangeLogger.shared.info(response, category: .network)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            switch httpResponse.statusCode {
            case 404:
                ExchangeLogger.shared.error(NetworkError.notFound.localizedDescription, category: .network)
                throw NetworkError.notFound
            default:
                ExchangeLogger.shared.error(NetworkError.invalidServerResponse.localizedDescription, category: .network)
                throw NetworkError.invalidServerResponse
            }
        }

        return data
    }
}
