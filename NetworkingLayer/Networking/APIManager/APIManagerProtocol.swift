public protocol APIManagerProtocol {
    func perform(_ request: any RequestProtocol) async throws -> Data
}
