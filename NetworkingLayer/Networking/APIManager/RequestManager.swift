public protocol RequestManagerProtocol {
    func perform<T: Response>(_ request: any RequestProtocol) async throws -> T
}

public class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol

    public init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    public func perform<T: Response>(_ request: any RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)

        let decoded: T = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}
