import UIKit

public final class FlexibleLandingCoordinator {
    
    weak var delegate: FlexibleLandingCoordinatorDelegate?
    
    // MARK: Properties
    
    public let landing: FlexibleLandingModel
    private let provider: FlexibleLandingProvider
    private let placeholder: Int
    
    private var navigationController: UINavigationController
    private var screenQueue: [FlexibleLandingScreen]
    
    // MARK: Initialization
    
    public init(landing: FlexibleLandingModel, placeholder: Int, provider: FlexibleLandingProvider) {
        self.provider = provider
        self.landing = landing
        self.placeholder = placeholder
        
        self.navigationController = provider.navigationController(for: landing)
        self.screenQueue = landing.screens
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
    
    private func dequeueScreen(at index: Int, animated: Bool) {
        guard let screen = screenQueue[safe: index] else {
            return finishLandingFlow(animated: animated)
        }
        let controller = provider.viewController(for: screen, in: self)
        DispatchQueue.main.async {
            self.navigationController.pushViewController(controller, animated: animated)
        }
    }
}

// MARK: - FlexibleLandingCoordinatorDelegate

extension FlexibleLandingCoordinator: FlexibleLandingScreenDelegate {
    
    public func finishScreenFlow(for screen: FlexibleLandingScreen, animated: Bool) {
        delegate?.flexibleLandingCoordinator(self, didFinishScreenFlow: screen)
        guard let index = screenQueue.firstIndex(of: screen) else {
            finishLandingFlow(animated: animated)
            return
        }
        dequeueScreen(at: index + 1, animated: animated)
    }
    
    public func finishLandingFlow(animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.dismiss(animated: animated) {
                self.delegate?.flexibleLandingCoordinator(self, didFinishLandingFlow: self.landing)
            }
        }
    }
    
    public func didCommitPurchase(of product: String, result: FlexibleLandingCommitPurchaseResult, screen: FlexibleLandingScreen) {
        delegate?.flexibleLandingCoordinator(self, didCommitPurchaseOf: product, screen: screen, result: result)
    }
}

// MARK: - Equatable

extension FlexibleLandingCoordinator: Equatable {
    
    public static func == (lhs: FlexibleLandingCoordinator, rhs: FlexibleLandingCoordinator) -> Bool {
        lhs.landing.id == rhs.landing.id
    }
}
