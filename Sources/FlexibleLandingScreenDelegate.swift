import Foundation

public protocol FlexibleLandingScreenDelegate: AnyObject {
    func finishScreenFlow(for screen: FlexibleLandingScreen, animated: Bool)
    func finishLandingFlow(animated: Bool)
}
