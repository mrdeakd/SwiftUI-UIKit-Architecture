import SwiftUI

public struct WindowManager {
    private weak var appDependency: AppDependency?
    private weak var navigationController: UINavigationController?

    public init(appDependency: AppDependency, navigationController: UINavigationController) {
        self.appDependency = appDependency
        self.navigationController = navigationController
    }

    public func addMainWindowTo(scene: UIScene) -> UIWindow? {
        guard let scene = (scene as? UIWindowScene) else { return nil }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }

    public func addLoadingWindowTo(scene: UIScene) -> UIWindow? {
        guard let scene = (scene as? UIWindowScene), let appDependency = appDependency else { return nil }
        let loadingHandler = appDependency.makeLoadingHandler()
        let loadingViewController = UIHostingController(rootView: LoadingView().environmentObject(loadingHandler))
        loadingViewController.view.backgroundColor = .clear

        let loadingWindow = PassThroughWindow(windowScene: scene)
        loadingWindow.rootViewController = loadingViewController
        loadingWindow.isHidden = false
        return loadingWindow
    }

    public func addAlertWindowTo(scene: UIScene) -> UIWindow? {
        guard let scene = (scene as? UIWindowScene), let appDependency = appDependency else { return nil }
        let alertHandler = appDependency.makeAlertHandler()
        let alertViewController = UIHostingController(rootView: AlertView().environmentObject(alertHandler))
        alertViewController.view.backgroundColor = .clear

        let alertWindow = PassThroughWindow(windowScene: scene)
        alertWindow.rootViewController = alertViewController
        alertWindow.isHidden = false
        return alertWindow
    }
}
