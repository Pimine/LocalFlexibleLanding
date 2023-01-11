import Foundation
import StoreKit

protocol FlexibleLandingCoordinatorDelegate: AnyObject {
    func flexibleLandingCoordinator(_ coordinator: FlexibleLandingCoordinator, didFinishScreenFlow screen: FlexibleLandingScreen)
    func flexibleLandingCoordinator(_ coordinator: FlexibleLandingCoordinator, didFinishLandingFlow landing: FlexibleLandingModel)
    func flexibleLandingCoordinator(
        _ coordinator: FlexibleLandingCoordinator,
        didCommitPurchaseOf product: String,
        screen: FlexibleLandingScreen,
        result: FlexibleLandingCommitPurchaseResult
    )
}
