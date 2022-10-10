//
//  File.swift
//  
//
//  Created by mufumade on 10.10.22.
//

import Foundation


/// RC Webhook Events
///
/// - Note: https://www.revenuecat.com/docs/webhooks#section-event-types
public enum EventType: String, Codable{
    /// Test event issued through the RevenueCat dashboard.
    case TEST
    
    /// A new subscription has been purchased.
    case INITIAL_PURCHASE
    
    /// A customer has made a purchase that will not auto-renew.
    case NON_RENEWING_PURCHASE
    
    /// An existing subscription has been renewed. This may occur at the end of the current billing period or later if a lapsed user re-subscribes.
    case RENEWAL
    
    /// A subscriber has changed the product of their subscription.
    case PRODUCT_CHANGE
    
    /// A subscription or non-renewing purchase has been cancelled. See cancellation reasons for more details.
    case CANCELLATION
    
    /// A non-expired cancelled subscription has been re-enabled.
    case UNCANCELLATION
    
    /// There has been a problem trying to charge the subscriber. This does not mean the subscription has expired.
    ///
    /// Can be safely ignored if listening to CANCELLATION event + cancel_reason=BILLING_ERROR.
    case BILLING_ISSUE
    
    /// Deprecated. A new app_user_id has been registered for an existing subscriber.
    @available(*, deprecated, message: "Deprecated. A new app_user_id has been registered for an existing subscriber.")
    case SUBSCRIBER_ALIAS
    
    /// A subscription has been paused.
    case SUBSCRIPTION_PAUSED
    
    /// A transfer of transactions and entitlements was initiated between one App User ID(s) to another.
    case TRANSFER
    
    
    ///A subscription has expired and access should be removed.
    ///
    /// If you have Platform Server Notifications configured, this event will occur as soon as we are notified (within seconds to minutes) of the expiration.
    ///
    /// If you do not have notifications configured, delays may be approximately 1 hour.
    case EXPIRATION
}
