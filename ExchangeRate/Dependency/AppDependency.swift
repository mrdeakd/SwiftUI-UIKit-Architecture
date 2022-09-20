import Foundation

public protocol AppDependencyProtocol: BaseDependency {
    func makeAppRepository() -> AppRepositoryProtocol
}

public class AppDependency: AppDependencyProtocol {
    public func makeAppRepository() -> AppRepositoryProtocol {
        AppRepository()
    }
}
