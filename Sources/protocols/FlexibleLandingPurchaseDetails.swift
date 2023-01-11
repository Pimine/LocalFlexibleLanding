import StoreKit

public protocol FlexibleLandingPurchaseDetails {
    var productId: String { get }
    var quantity: Int { get }
    var product: SKProduct { get }
    var transaction: FlexibleLandingPaymentTransaction { get }
    var originalTransaction: FlexibleLandingPaymentTransaction? { get }
    var needsFinishTransaction: Bool { get }
}
