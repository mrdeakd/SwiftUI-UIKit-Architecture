import SwiftUI
import CoreMotion

protocol CreatorScreenViewModelProtocol: ObservableObject {
    func closeScreen()

    var xLocation: Double { get }
    var yLocation: Double { get }
}

final class CreatorScreenViewModel: CreatorScreenViewModelProtocol {
    private let navigation: CreatorScreenNavigationProtocol

    private let motionManager = CMMotionManager()
    @Published public var xLocation = 0.0
    @Published public var yLocation = 0.0

    init(navigation: CreatorScreenNavigationProtocol) {
        self.navigation = navigation

        motionManager.deviceMotionUpdateInterval = 1 / 30
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, _ in
            guard let motion = data?.attitude else { return }
            self?.xLocation = motion.roll
            self?.yLocation = motion.pitch
        }
    }

    func closeScreen() {
        navigation.onClose?()
    }
}
