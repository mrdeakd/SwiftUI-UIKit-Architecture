import Foundation
import UIKit

public final class AppCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var onFinished: (() -> Void)

    private let repository: AppRepositoryProtocol
    private let factory: AppModuleFactoryProtocol
    
    private let dependecySolver: AppDependency
    
    public init(
        dependencySolver: AppDependency,
        navigationController: UINavigationController,
        onFinished: @escaping (() -> Void)
    ) {
        self.dependecySolver = dependencySolver
        self.factory = AppModuleFactory(dependencySolver)
        self.navigationController = navigationController
        self.onFinished = onFinished
        self.repository = dependencySolver.makeAppRepository()
    }
    
    public func start() {
        gotoMainScreen()
    }
    
    private func gotoMainScreen() {
        var module = factory.createMainScreen(repository: repository)
        
        module.navigation.onFinish = { [weak self] in
            print("Finished")
        }
        
        navigationController.pushViewController(module.viewController, animated: !navigationController.viewControllers.isEmpty)
    }
}
