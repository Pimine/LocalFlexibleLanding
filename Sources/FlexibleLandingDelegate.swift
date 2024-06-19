import Foundation

public protocol FlexibleLandingDelegate: AnyObject {
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didPresentScreen screen: FlexibleLandingScreen,
        with context: [String: Any],
        in landing: FlexibleLandingModel
    )
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishScreenFlow screen: FlexibleLandingScreen,
        with context: [String: Any],
        in landing: FlexibleLandingModel
    )
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishLandingFlow landing: FlexibleLandingModel,
        with context: [String: Any]
    )
}

// MARK: - Default implementation

public extension FlexibleLandingDelegate {
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didPresentScreen screen: FlexibleLandingScreen,
        with context: [String: Any],
        in landing: FlexibleLandingModel
    ) { }
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishScreenFlow screen: FlexibleLandingScreen,
        with context: [String: Any],
        in landing: FlexibleLandingModel
    ) { }
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishLandingFlow landing: FlexibleLandingModel,
        with context: [String: Any]
    ) { }
}
