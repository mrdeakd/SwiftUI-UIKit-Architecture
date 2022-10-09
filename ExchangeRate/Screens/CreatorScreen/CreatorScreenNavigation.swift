import Foundation

protocol CreatorScreenNavigationProtocol {
    var onClose: (() -> Void)? { get set }
}

final class CreatorScreenNavigation: CreatorScreenNavigationProtocol {
    var onClose: (() -> Void)?
}
