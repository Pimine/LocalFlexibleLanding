import Foundation
import UIKit

public final class FlexibleLanding {
    
    public weak var delegate: FlexibleLandingDelegate?
    
    // MARK: Properties
    
    private let provider: FlexibleLandingProvider
    private var coordinators: [FlexibleLandingCoordinator] = []
    
    // MARK: Initialization
    
    public init(provider: FlexibleLandingProvider) {
        self.provider = provider
    }
    
    // MARK: API
    
    public func showLanding(
        _ landing: FlexibleLandingModel,
        context: [String: Any],
        animated: Bool,
        completion: (() -> Void)? = nil
    ) -> UINavigationController {
        
        let coordinator = makeCoordinator(for: landing, context: context)
        coordinators.append(coordinator)
        coordinator.start(animated: animated, completion: completion)
        
        return coordinator.navigationController
    }
}

// MARK: - FlexibleLandingCoordinatorDelegate
extension FlexibleLanding: FlexibleLandingCoordinatorDelegate {
    
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didFinishScreenFlow screen: FlexibleLandingScreen
    ) {
        delegate?.flexibleLanding(self, didFinishScreenFlow: screen, in: coordinator.landing)
    }
    
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didFinishLandingFlow landing: FlexibleLandingModel
    ) {
        coordinators.removeAll(coordinator)
        delegate?.flexibleLanding(self, didFinishLandingFlow: landing)
    }
}

// MARK: Makers
private extension FlexibleLanding {
    
    func makeCoordinator(for landing: FlexibleLandingModel, context: [String: Any]) -> FlexibleLandingCoordinator {
        let coordinator = FlexibleLandingCoordinator(landing: landing, context: context, provider: provider)
        coordinator.delegate = self
        return coordinator
    }
}
