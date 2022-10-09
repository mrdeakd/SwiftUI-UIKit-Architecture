import UIKit
import SwiftUI

protocol AppModuleFactoryProtocol {
    func createMainScreen(repository: AppRepositoryProtocol) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol)
    func createCreatorScreen() -> (viewController: UIViewController, navigation: CreatorScreenNavigationProtocol)
}

final class AppModuleFactory: AppModuleFactoryProtocol {
    private let dependencySolver: AppDependencyProtocol

    init(_ dependencySolver: AppDependencyProtocol) {
        self.dependencySolver = dependencySolver
    }
    
    func createMainScreen(repository: AppRepositoryProtocol) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol) {
        let navigation = MainScreenNavigation()
        let viewModel = MainScreenViewModel(
            navigation: navigation,
            repository: repository,
            overlayManager: dependencySolver.makeOverlayManager())
        let view = MainScreenView(viewModel: viewModel)
        
        return (UIHostingController(rootView: view), navigation)
    }
    
    func createCreatorScreen() -> (viewController: UIViewController, navigation: CreatorScreenNavigationProtocol) {
        let navigation = CreatorScreenNavigation()
        let viewModel = CreatorScreenViewModel(
            navigation: navigation
        )
        let view = CreatorScreenView(viewModel: viewModel)
        
        return (UIHostingController(rootView: view), navigation)
    }
}
