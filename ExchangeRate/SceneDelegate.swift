import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var appDependency = AppDependency()
    private var windowManager: WindowManager?
    private var coordinator: AppCoordinator?
    
    var mainWindow: UIWindow?
    var alertWindow: UIWindow?
    var loadingWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupDependencies()

        mainWindow = windowManager?.addMainWindowTo(scene: scene)
        alertWindow = windowManager?.addAlertWindowTo(scene: scene)
        loadingWindow = windowManager?.addLoadingWindowTo(scene: scene)

        coordinator?.start()
    }
    
    func setupDependencies() {
        let rootNavigationController = appDependency.makeRootNavigationController()
        windowManager = WindowManager(appDependency: appDependency, navigationController: rootNavigationController)
        
        coordinator = AppCoordinator(
            dependencySolver: appDependency,
            navigationController: rootNavigationController,
            onFinished: {}
        )
    }
}
