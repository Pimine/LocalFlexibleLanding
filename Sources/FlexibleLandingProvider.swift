import UIKit

public protocol FlexibleLandingProvider {
    func navigationController(for landing: FlexibleLandingModel) -> UINavigationController
    func viewController(for screen: FlexibleLandingScreen, in coordinator: FlexibleLandingCoordinator) -> UIViewController
}
