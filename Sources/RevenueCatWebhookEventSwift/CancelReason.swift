//
//  File.swift
//  
//
//  Created by mufumade on 10.10.22.
//

import Foundation

public typealias ExpirationReason = CancelReason
public enum CancelReason: String, Codable{
    /// Subscriber cancelled voluntarily. This event fires when a user unsubscribes, not when the subscription expires.
    case UNSUBSCRIBE
    
    /// Apple, Amazon, or Google could not charge the subscriber using their payment method.
    
    /// The CANCELLATION event with cancellation reason BILLING_ERROR is fired as soon as the billing issue has been detected. The EXPIRATION event with expiration reason BILLING_ERROR is fired if the grace period (if set up) has ended without recovering the payment, and the customer should lose access to the subscription.
    case BILLING_ERROR
    
    /// Developer cancelled the subscription.
    case DEVELOPER_INITIATED
    
    /// Subscriber did not agree to a price increase.
    case PRICE_INCREASE
    
    /// Customer cancelled through Apple support and received a refund, a Play Store subscription was refunded through RevenueCat, an Amazon subscription was refunded through Amazon support, or a web subscription was refunded.
    case CUSTOMER_SUPPORT
    
    /// Apple did not provide the reason of the cancellation.
    case UNKNOWN
    
    /// The subscription expired because it was paused (only EXPIRATION event)
    case SUBSCRIPTION_PAUSED
}
