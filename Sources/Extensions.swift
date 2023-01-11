import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        windows.filter { $0.isKeyWindow }.first
    }
    
    var topViewController: UIViewController? {
        guard let rootViewController = keyWindow?.rootViewController else { return nil }
        return topViewController(base: rootViewController)
    }
    
    func topViewController(base: UIViewController) -> UIViewController {
        // Navigation controller
        if
            let navigationController = base as? UINavigationController,
            let visibleController = navigationController.visibleViewController {
            return topViewController(base: visibleController)
        // TabBar controller
        } else if
            let tabBarController = base as? UITabBarController,
            let selectedController = tabBarController.selectedViewController {
            return topViewController(base: selectedController)
        // Default presented controller
        } else if let presented = base.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension Array where Element: Equatable {
    @discardableResult
    mutating func removeAll(_ item: Element) -> [Element] {
        removeAll(where: { $0 == item })
        return self
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
