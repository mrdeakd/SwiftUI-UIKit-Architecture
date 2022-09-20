import UIKit
import SwiftUI

protocol AppModuleFactoryProtocol {
    func createMainScreen(repository: AppRepositoryProtocol) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol)
}

final class AppModuleFactory: AppModuleFactoryProtocol {
    private let dependencySolver: AppDependency

    init(_ dependencySolver: AppDependency) {
        self.dependencySolver = dependencySolver
    }
    
    func createMainScreen(repository: AppRepositoryProtocol) -> (viewController: UIViewController, navigation: MainScreenNavigationProtocol) {
        let navigation = MainScreenNavigation()
        let viewModel = MainScreenViewModel(navigation: navigation, repository: repository)
        let view = MainScreenView(viewModel: viewModel)
        
        return (UIHostingController(rootView: view), navigation)
    }
}
