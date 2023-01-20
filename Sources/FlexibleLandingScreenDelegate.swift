import Foundation

public protocol FlexibleLandingScreenDelegate: AnyObject {
    func finishScreenFlow(for screen: FlexibleLandingScreen, animated: Bool, completion: (() -> Void)?)
    func finishLandingFlow(animated: Bool, completion: (() -> Void)?)
}
