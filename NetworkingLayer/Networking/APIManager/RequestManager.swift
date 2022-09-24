import Utils

public protocol RequestManagerProtocol {
    func perform<T: Response>(_ request: any RequestProtocol) async throws -> T
}

public class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: CustomParser?

    public init(apiManager: APIManagerProtocol = APIManager(), parser: CustomParser? = nil) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    public func perform<T: Response>(_ request: any RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        
        if let parser = parser {
            let decoded: T =  parser.parse(data: data, to: T.self)
            return decoded
        }

        let decoded: T = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}
