import Foundation
import UIKit

public final class AppCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var onFinished: (() -> Void)

    private let repository: AppRepositoryProtocol
    private let factory: AppModuleFactoryProtocol

    private let dependecySolver: AppDependencyProtocol

    public init(
        dependencySolver: AppDependencyProtocol,
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

        module.navigation.onFinish = {
            print("Finished")
        }

        module.navigation.onGoToCreatorScreen = { [weak self] in
            self?.goToCreatorScreen()
        }

        navigationController.pushViewController(
            module.viewController,
            animated: !navigationController.viewControllers.isEmpty
        )
    }

    private func goToCreatorScreen() {
        var module = factory.createCreatorScreen()

        module.navigation.onClose = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }

        navigationController.pushViewController(
            module.viewController,
            animated: !navigationController.viewControllers.isEmpty
        )
    }
}
