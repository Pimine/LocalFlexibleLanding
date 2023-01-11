import StoreKit

public protocol FlexibleLandingPaymentTransaction {
    var transactionDate: Date? { get }
    var transactionState: SKPaymentTransactionState { get }
    var transactionIdentifier: String? { get }
    var downloads: [SKDownload] { get }
}
