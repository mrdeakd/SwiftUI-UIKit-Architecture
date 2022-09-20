import NetworkingLayer

protocol ServiceProtocol {
    var requestManager: RequestManager { get }
    func call<T>(request: T) async throws -> T.ApiResponse where T: RequestProtocol
}

extension ServiceProtocol {
    func call<T>(request: T) async throws -> T.ApiResponse where T: RequestProtocol {
        try await requestManager.perform(request)
    }
}
