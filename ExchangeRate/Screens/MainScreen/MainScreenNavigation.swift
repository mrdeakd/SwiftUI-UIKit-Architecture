import Foundation

protocol MainScreenNavigationProtocol {
    var onFinish: (() -> Void)? { get set }
}

final class MainScreenNavigation: MainScreenNavigationProtocol {
    var onFinish: (() -> Void)?
}
