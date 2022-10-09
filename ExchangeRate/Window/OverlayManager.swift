import UIKit

public protocol OverlayManagerProtocol {
    func asyncRequestWithLoading<T>(
        request: @autoclosure () async throws -> T,
        onLoaded action: @escaping (T) -> Void
    ) async
}

public class OverlayManager: OverlayManagerProtocol {
    private let loadingHandler: LoadingHandler
    private let alertHandler: AlertHandler

    public init(appDependency: AppDependency) {
        self.loadingHandler = appDependency.makeLoadingHandler()
        self.alertHandler = appDependency.makeAlertHandler()
    }

    public func asyncRequestWithLoading<T>(
        request: () async throws -> T,
        onLoaded action: @escaping (T) -> Void
    ) async {
        await executeLoading(request: request, onLoaded: action)
    }

    func executeLoading<T>(
        request: () async throws -> T,
        onLoaded action: @escaping (T) -> Void,
        onCatch: ((Error) -> Void)? = nil
    ) async {
        DispatchQueue.main.async { [weak self] in
            self?.loadingHandler.showLoading()
        }
        do {
            let response = try await request()
            DispatchQueue.main.async { [weak self] in
                self?.loadingHandler.hideLoading()
                action(response)
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.loadingHandler.hideLoading()
                guard let onCatch = onCatch else {
                    self?.alertHandler.addItemToAlertQueue(
                        item: AlertHandler.Item(message: error.localizedDescription, delay: 5, didFinish: {
                            self?.alertHandler.hideAfter()
                        })
                    )
                    return
                }
                onCatch(error)
            }
        }
    }
}
