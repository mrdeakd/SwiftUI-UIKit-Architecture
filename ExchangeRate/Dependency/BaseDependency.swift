import Foundation
import UIKit

public protocol BaseDependency {
    func makeRootNavigationController() -> UINavigationController
}

extension BaseDependency {
    public func makeRootNavigationController() -> UINavigationController {
        UINavigationController()
    }
}
