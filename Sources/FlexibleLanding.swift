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
    
    public func queueLanding(
        _ landing: FlexibleLandingModel,
        context: [String: Any]
    ) -> FlexibleLandingCoordinator {
        let coordinator = makeCoordinator(for: landing, context: context)
        coordinators.append(coordinator)
        return coordinator
    }
}

// MARK: - FlexibleLandingCoordinatorDelegate
extension FlexibleLanding: FlexibleLandingCoordinatorDelegate {
    
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didPresentScreen screen: FlexibleLandingScreen
    ) {
        delegate?.flexibleLanding(
            self, didPresentScreen: screen,
            with: coordinator.context,
            in: coordinator.landing
        )
    }
    
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didFinishScreenFlow screen: FlexibleLandingScreen
    ) {
        delegate?.flexibleLanding(
            self,
            didFinishScreenFlow: screen,
            with: coordinator.context,
            in: coordinator.landing
        )
    }
    
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didFinishLandingFlow landing: FlexibleLandingModel
    ) {
        coordinators.removeAll(coordinator)
        delegate?.flexibleLanding(
            self,
            didFinishLandingFlow: coordinator.landing,
            with: coordinator.context
        )
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
