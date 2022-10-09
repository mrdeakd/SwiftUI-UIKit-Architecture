import Foundation

protocol MainScreenNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
    var onGoToCreatorScreen: (() -> Void)? { get set }
}

final class MainScreenNavigation: MainScreenNavigationProtocol {
    var onFinish: (() -> Void)?
    var onGoToCreatorScreen: (() -> Void)?
}
