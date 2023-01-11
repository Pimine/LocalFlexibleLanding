import Foundation
import StoreKit

protocol FlexibleLandingCoordinatorDelegate: AnyObject {
    func flexibleLandingCoordinator(_ coordinator: FlexibleLandingCoordinator, didFinishScreenFlow screen: FlexibleLandingScreen)
    func flexibleLandingCoordinator(_ coordinator: FlexibleLandingCoordinator, didFinishLandingFlow landing: FlexibleLandingModel)
}
