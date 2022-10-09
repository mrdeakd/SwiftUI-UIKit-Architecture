import Foundation

public protocol AppDependencyProtocol: BaseDependency {
    func makeOverlayManager() -> OverlayManagerProtocol
    func makeAppRepository() -> AppRepositoryProtocol
    func makeLoadingHandler() -> LoadingHandler
}

public class AppDependency: AppDependencyProtocol {
    private let loadingHandler = LoadingHandler()
    private let alertHandler = AlertHandler()

    public func makeAppRepository() -> AppRepositoryProtocol {
        AppRepository()
    }

    public func makeOverlayManager() -> OverlayManagerProtocol {
        OverlayManager(appDependency: self)
    }

    public func makeLoadingHandler() -> LoadingHandler {
        loadingHandler
    }

    public func makeAlertHandler() -> AlertHandler {
        alertHandler
    }
}
