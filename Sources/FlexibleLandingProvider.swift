import UIKit

public protocol FlexibleLandingProvider {
    func navigationController(
        for landing: FlexibleLandingModel,
        coordinator: FlexibleLandingCoordinator) -> UINavigationController
    
    func viewController(
        for screen: FlexibleLandingScreen,
        inside landing: FlexibleLandingModel,
        coordinator: FlexibleLandingCoordinator) -> UIViewController
}
