import UIKit

public protocol FlexibleLandingProvider {
    func navigationController(
        for landing: FlexibleLandingModel,
        context: [String: Any]) -> UINavigationController
    
    func viewController(
        for screen: FlexibleLandingScreen,
        inside landing: FlexibleLandingModel,
        context: [String: Any]) -> UIViewController
}
