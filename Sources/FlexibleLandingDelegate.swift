import Foundation

public protocol FlexibleLandingDelegate: AnyObject {
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishScreenFlow screen: FlexibleLandingScreen,
        in landing: FlexibleLandingModel
    )
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishLandingFlow landing: FlexibleLandingModel
    )
}

// MARK: - Default implementation

public extension FlexibleLandingDelegate {
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishScreenFlow screen: FlexibleLandingScreen,
        in landing: FlexibleLandingModel
    ) { }
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didFinishLandingFlow landing: FlexibleLandingModel
    ) { }
}
