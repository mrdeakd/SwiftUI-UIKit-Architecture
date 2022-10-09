import SwiftUI
import CoreMotion

protocol CreatorScreenViewModelProtocol: ObservableObject {
    func closeScreen()

    var x: Double { get }
    var y: Double { get }
}

final class CreatorScreenViewModel: CreatorScreenViewModelProtocol {
    private let navigation: CreatorScreenNavigationProtocol
    
    private let motionManager = CMMotionManager()
    @Published public var x = 0.0
    @Published public var y = 0.0
    
    init(navigation: CreatorScreenNavigationProtocol) {
        self.navigation = navigation
        
        motionManager.deviceMotionUpdateInterval = 1 / 30
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
    
    func closeScreen() {
        navigation.onClose?()
    }
}
