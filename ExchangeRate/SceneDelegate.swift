import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        
    private var coordinator = AppCoordinator(dependencySolver: AppDependency(), navigationController: UINavigationController(), onFinished: {})
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}
