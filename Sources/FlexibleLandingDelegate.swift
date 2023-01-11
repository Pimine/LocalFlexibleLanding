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
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didCommitPurchaseOf product: String,
        screen: FlexibleLandingScreen,
        landing: FlexibleLandingModel,
        withResult result: FlexibleLandingCommitPurchaseResult
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
    
    func flexibleLanding(
        _ flexibleLanding: FlexibleLanding,
        didCommitPurchaseOf product: String,
        screen: FlexibleLandingScreen,
        landing: FlexibleLandingModel,
        withResult result: FlexibleLandingCommitPurchaseResult
    ) { }
}
