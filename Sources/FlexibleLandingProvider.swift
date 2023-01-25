import UIKit

public protocol FlexibleLandingProvider {
    func navigationController(
        for landing: FlexibleLandingModel,
        context: [String: Any],
        coordinator: FlexibleLandingCoordinator) -> UINavigationController
    
    func viewController(
        for screen: FlexibleLandingScreen,
        inside landing: FlexibleLandingModel,
        context: [String: Any],
        coordinator: FlexibleLandingCoordinator) -> UIViewController
}
