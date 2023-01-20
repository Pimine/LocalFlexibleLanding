import UIKit

public final class FlexibleLandingCoordinator {
    
    weak var delegate: FlexibleLandingCoordinatorDelegate?
    
    // MARK: Properties
    
    public let landing: FlexibleLandingModel
    
    public let placeholder: Int
    
    private let provider: FlexibleLandingProvider
    
    private var screenQueue: [FlexibleLandingScreen]
    
    private(set) var navigationController: UINavigationController!
    
    // MARK: Initialization
    
    public init(landing: FlexibleLandingModel, placeholder: Int, provider: FlexibleLandingProvider) {
        self.provider = provider
        self.landing = landing
        self.placeholder = placeholder
        
        self.screenQueue = landing.screens
        self.navigationController = provider.navigationController(for: landing, coordinator: self)
    }
    
    // MARK: Methods
    
    func start(animated: Bool, completion: (() -> Void)? = nil) {
        dequeueScreen(at: 0, animated: false)
        DispatchQueue.main.async {
            UIApplication.shared.topViewController?.present(
                self.navigationController,
                animated: animated,
                completion: completion
            )
        }
    }
    
    private func dequeueScreen(at index: Int, animated: Bool, completion: (() -> Void)? = nil) {
        guard let screen = screenQueue[safe: index] else {
            return finishLandingFlow(animated: animated)
        }
        let controller = provider.viewController(for: screen, inside: landing, coordinator: self)
        DispatchQueue.main.async {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController.pushViewController(controller, animated: animated)
            CATransaction.commit()
        }
    }
}

// MARK: - FlexibleLandingCoordinatorDelegate

extension FlexibleLandingCoordinator: FlexibleLandingScreenDelegate {
    
    public func finishScreenFlow(for screen: FlexibleLandingScreen, animated: Bool, completion: (() -> Void)? = nil) {
        guard let index = screenQueue.firstIndex(of: screen) else {
            finishLandingFlow(animated: animated, completion: {
                self.delegate?.flexibleLandingCoordinator(self, didFinishScreenFlow: screen)
                completion?()
            })
            return
        }
        dequeueScreen(at: index + 1, animated: animated, completion: {
            self.delegate?.flexibleLandingCoordinator(self, didFinishScreenFlow: screen)
            completion?()
        })
    }
    
    public func finishLandingFlow(animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.navigationController.dismiss(animated: animated) {
                self.delegate?.flexibleLandingCoordinator(self, didFinishLandingFlow: self.landing)
                completion?()
            }
        }
    }
}

// MARK: - Equatable

extension FlexibleLandingCoordinator: Equatable {
    
    public static func == (lhs: FlexibleLandingCoordinator, rhs: FlexibleLandingCoordinator) -> Bool {
        lhs.landing.id == rhs.landing.id
    }
}
