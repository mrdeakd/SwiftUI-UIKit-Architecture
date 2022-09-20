import Foundation
import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get }
    var onFinished: (() -> Void) { get set }
    func start()
}
