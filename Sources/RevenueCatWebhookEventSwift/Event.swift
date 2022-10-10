//
//  Event.swift
//  
//
//  Created by mufumade on 10.10.22.
//

import Foundation


public struct Event: Codable {
    
    /// Product identifier of the subscription.
    public let productID: String
    
    ///Deprecated. See entitlement_ids.
    @available(*, deprecated, message: "See entitlement_ids.")
    public let entitlementID: String?
    
    /// Entitlement identifiers of the subscription.
    public let entitlementIDS: [String]?
    
    /// Period type of the transaction.
    public let periodType: PeriodType
    
    /// Time when the transaction was purchased. Measured in milliseconds since Unix epoch
    public let purchasedAtMS: Int
    
    /// Only available for **BILLING_ISSUE** events.
    ///
    ///The time that the grace period for the subscription would expire. Measured in milliseconds since Unix epoch. Use this field to determine if the user is currently in a grace period.
    /// - Note: It can be NULL if subscription does not have a grace period.
    public let gracePeriodExpirationAtMS: Int?
    
    ///Expiration of the transaction. Measured in milliseconds since Unix epoch. Use this field to determine if a subscription is still active.
    /// - Note: It can be NULL for non-subscription purchases.
    public let expirationAtMS: Int?
    
    /// The time when an Android subscription would resume after being paused. Measured in milliseconds since Unix epoch.
    /// - Note: **Only available for Play Store subscriptions and SUBSCRIPTION_PAUSED events.**
    public let autoResumeAtMS: Int?
    
    /// Store the subscription belongs to.
    public let store: Store
    
    /// Store environment.
    public let environment: Environment
    
    
    /// Whether the previous transaction was a free trial or not.
    ///
    /// - Note: **Only available for RENEWAL events.**
    public let isTrialConversion: Bool?
    
    
    /// **Only available for CANCELLATION events.**
    public let cancelReason: CancelReason?
    
    /// **Only available for EXPIRATION events.**
    public let expirationReason: ExpirationReason?
    
    /// Product identifier of the new product the subscriber has switched to. Only available for App Store subscriptions and PRODUCT_CHANGE events.
    public let newProductID: String?
    
    ///Not available for apps using legacy entitlements.
    
    /// The identifier for the offering that was presented to the user during their initial purchase.
    public let presentedOfferingID: String?

    /// The USD price of the transaction.
    ///
    /// - Note: Can be NULL if the price is unknown, and 0 for free trials.
    /// - Note: Can be negative for refunds.
    public let price: Double?
    
    /// The ISO 4217 currency code that the product was purchased in.
    ///
    /// USD, CAD, etc.
    /// - Note: Can be NULL if the currency is unknown.
    public let currency: String?
    
    /// The price of the transaction in the currency the product was purchased in.
    ///
    /// - Note: Can be NULL if the price is unknown, and 0 for free trials.
    /// - Note: Can be negative for refunds.
    public let priceInPurchasedCurrency: Double?
    
    
    /// The estimated percentage of the transaction price that was deducted for taxes (varies by country and store).
    /// - Note: Can be NULL if the tax percentage is unknown.
    public let taxPercentage: Double?
    
    /// The estimated percentage of the transaction price that was deducted as a store commission / processing fee.
    /// - Note: Can be NULL if the commission percentage is unknown.
    public let commissionPercentage: Double?
    
    
    
    /// The estimated percentage of the transaction price that will be paid out to developers after commissions, but before VAT and DST taxes are taken into account.
    @available(*, deprecated, message: "We recommend using tax_percentage and commission_percentage to calculate proceeds instead.")
    public let takehomePercentage: Double?

    /// Map of attribute names to attribute objects.
    public let subscriberAttributes: String?
    
    /// Transaction identifier from Apple/Amazon/Google/Stripe.
    public let transactionID: String
    
    
    /// transaction_id of the original transaction in the subscription from Apple/Amazon/Google/Stripe.
    public let originalTransactionID: String
    
    
    /// Indicates if the user made this purchase or if it was shared to them via Family Sharing.
    ///
    /// - Note: Always false for non-Apple purchases.
    public let isFamilyShare: Bool?

    /// App User ID(s) that transactions and entitlements are being taken from, and granted to transferred_to.
    ///
    /// - Note: This fields is only available when type is set to TRANSFER.
    public let transferredFrom: [String]?
    
    /// App User ID(s) that are receiving the transactions and entitlements taken from transferred_from.
    ///
    /// - Note: This field is only available when type is set to TRANSFER.
    public let transferredTo: [String]?
    
    /// The ISO 3166 country code that the product was purchased in.
    ///
    /// The two-letter country code (e.g., US, GB, CA) of the app user's location (this country code is derived from the last seen request from the SDK for the subscriber.)
    public let countryCode:String
    
    
    /// The offer code that the customer used to redeem the transaction.
    ///
    /// Available for App Store and Play Store. For App Store this property corresponds to the offer_code_ref_name. For Play Store this corresponds to the promotionCode.
    ///
    /// - Note: This field is not available when type is set to SUBSCRIBER_ALIAS or TRANSFER.
    /// - Note: Can be null if no offer code was used for this product.
    public let offerCode: String?
    
    //---------------------------------------------------------------------------
    // COMMON FIELDES
    //---------------------------------------------------------------------------
    /// Type of the event
    public let type: EventType
    
    /// Unique identifier of the event.
    public let id: String

    /// Unique identifier of the app the event is associated with. Corresponds to an app within a project.
    ///
    /// This value will soon be visible in the app's configuration page in project settings.
    public let appID: String
    
    /// The time that the event was generated. Does not necessarily coincide with when the action that triggered the event occurred (purchased, cancelled, etc).
    public let eventTimestampMS: Int

    /// Last seen app user id of the subscriber.
    public let appUserID: String
    
    /// The first app user id used by the subscriber.
    public let originalAppUserID: String
    
    /// All app user ids ever used by the subscriber.
    public let aliases: [String]
    
    //---------------------------------------------------------------------------
    // COMMON FIELDES
    //---------------------------------------------------------------------------
    
    

    enum CodingKeys: String, CodingKey {
        case aliases
        case appID = "app_id"
        case appUserID = "app_user_id"
        case countryCode = "country_code"
        case currency
        case entitlementID = "entitlement_id"
        case entitlementIDS = "entitlement_ids"
        case environment
        case eventTimestampMS = "event_timestamp_ms"
        case expirationAtMS = "expiration_at_ms"
        case id
        case isFamilyShare = "is_family_share"
        case offerCode = "offer_code"
        case originalAppUserID = "original_app_user_id"
        case originalTransactionID = "original_transaction_id"
        case periodType = "period_type"
        case presentedOfferingID = "presented_offering_id"
        case price
        case priceInPurchasedCurrency = "price_in_purchased_currency"
        case productID = "product_id"
        case purchasedAtMS = "purchased_at_ms"
        case store
        case subscriberAttributes = "subscriber_attributes"
        case takehomePercentage = "takehome_percentage"
        case transactionID = "transaction_id"
        case type
        case gracePeriodExpirationAtMS = "grace_period_expiration_at_ms"
        case autoResumeAtMS = "auto_resume_at_ms"
        case isTrialConversion = "is_trial_conversion"
        case cancelReason = "cancel_reason"
        case expirationReason = "expiration_reason"
        case newProductID = "new_product_id"
        case taxPercentage = "tax_percentage"
        case commissionPercentage = "commission_percentage"
        case transferredFrom = "transferred_from"
        case transferredTo = "transferred_to"
    }
}
