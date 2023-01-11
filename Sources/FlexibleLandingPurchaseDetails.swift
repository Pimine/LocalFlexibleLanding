import StoreKit

public struct FlexibleLandingPurchaseDetails {
    public let productId: String
    public let quantity: Int
    public let product: SKProduct
    public let transaction: FlexibleLandingPaymentTransaction
    public let originalTransaction: FlexibleLandingPaymentTransaction?
    public let needsFinishTransaction: Bool
    
    public init(
        productId: String,
        quantity: Int,
        product: SKProduct,
        transaction: FlexibleLandingPaymentTransaction,
        originalTransaction: FlexibleLandingPaymentTransaction?,
        needsFinishTransaction: Bool
    ) {
        self.productId = productId
        self.quantity = quantity
        self.product = product
        self.transaction = transaction
        self.originalTransaction = originalTransaction
        self.needsFinishTransaction = needsFinishTransaction
    }
}
