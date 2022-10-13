import XCTest
import AnyCodable
@testable import RevenueCatWebhookEventSwift

final class RevenueCatWebhookEventSwiftTests: XCTestCase {
    
    func testDecodeINITIAL_PURCHASE(){
        let testEvent = Data("""
{\"event\": {\"event_timestamp_ms\": 1665577477239, \"product_id\": \"tier_1_0299_1m\", \"period_type\": \"NORMAL\", \"purchased_at_ms\": 1665577468000, \"expiration_at_ms\": 1665577768000, \"environment\": \"SANDBOX\", \"entitlement_id\": null, \"entitlement_ids\": [\"premium\"], \"presented_offering_id\": null, \"transaction_id\": \"2000000xxxxxxx\", \"original_transaction_id\": \"2000000xxxxxxx\", \"is_family_share\": false, \"country_code\": \"IE\", \"app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"aliases\": [\"079d31e3-315d-4506-a85e-xxxXXXxxx\"], \"original_app_user_id\": \"079d31e3-315d-4506-a85e-XXXxxxXXX\", \"currency\": \"EUR\", \"price\": 2.898, \"price_in_purchased_currency\": 2.99, \"subscriber_attributes\": {\"$attConsentStatus\": {\"value\": \"denied\", \"updated_at_ms\": 1665577476055}}, \"store\": \"APP_STORE\", \"takehome_percentage\": 0.7, \"offer_code\": null, \"tax_percentage\": 0.1118, \"commission_percentage\": 0.3, \"type\": \"INITIAL_PURCHASE\", \"id\": \"AE9639F7-6605-401D-B7FF-XXXXXXX\", \"app_id\": \"app-XXXXXxXX\"}, \"api_version\": \"1.0\"}
""".utf8)
        
        XCTAssertNoThrow(try JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent))
        
        let rcEvent:RevenueCatWebhook = try! JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent)
        
        
        XCTAssertEqual(rcEvent.apiVersion, "1.0")
        
        XCTAssertEqual(rcEvent.event.id, "AE9639F7-6605-401D-B7FF-XXXXXXX")
        XCTAssertNil(rcEvent.event.cancelReason)
        XCTAssertEqual(rcEvent.event.type, .INITIAL_PURCHASE)
        XCTAssertEqual(rcEvent.event.aliases, ["079d31e3-315d-4506-a85e-xxxXXXxxx"])
        XCTAssertEqual(rcEvent.event.appID, "app-XXXXXxXX")
        XCTAssertEqual(rcEvent.event.appUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertNil(rcEvent.event.autoResumeAtMS)
        XCTAssertEqual(rcEvent.event.commissionPercentage, 0.3)
        XCTAssertEqual(rcEvent.event.countryCode, "IE")
        XCTAssertEqual(rcEvent.event.currency, "EUR")
        XCTAssertEqual(rcEvent.event.entitlementIDS, ["premium"])
        XCTAssertEqual(rcEvent.event.environment, .SANDBOX)
        XCTAssertEqual(rcEvent.event.eventTimestampMS, 1665577477239)
        XCTAssertEqual(rcEvent.event.expirationAtMS, 1665577768000)
        XCTAssertNil(rcEvent.event.expirationReason)
        XCTAssertNil(rcEvent.event.gracePeriodExpirationAtMS)
        XCTAssertFalse(rcEvent.event.isFamilyShare)
        XCTAssertNil(rcEvent.event.isTrialConversion)
        XCTAssertNil(rcEvent.event.newProductID)
        XCTAssertNil(rcEvent.event.offerCode)
        XCTAssertEqual(rcEvent.event.originalAppUserID, "079d31e3-315d-4506-a85e-XXXxxxXXX")
        XCTAssertEqual(rcEvent.event.originalTransactionID, "2000000xxxxxxx")
        XCTAssertEqual(rcEvent.event.periodType, .NORMAL)
        XCTAssertNil(rcEvent.event.presentedOfferingID)
        XCTAssertEqual(rcEvent.event.price, 2.898)
        XCTAssertEqual(rcEvent.event.priceInPurchasedCurrency, 2.99)
        XCTAssertEqual(rcEvent.event.productID, "tier_1_0299_1m")
        XCTAssertEqual(rcEvent.event.purchasedAtMS, 1665577468000)
        XCTAssertEqual(rcEvent.event.store, .APP_STORE)
        
        let anyCodableTest: AnyCodable = AnyCodable(["value": "denied", "updated_at_ms": 1665577476055])
        XCTAssertEqual(rcEvent.event.subscriberAttributes, ["$attConsentStatus": anyCodableTest])
        XCTAssertEqual(rcEvent.event.taxPercentage, 0.1118)
        XCTAssertEqual(rcEvent.event.transactionID, "2000000xxxxxxx")
        XCTAssertNil(rcEvent.event.transferredFrom)
        XCTAssertNil(rcEvent.event.transferredTo)
    }
    
    
    func testDecodeRENEWAL(){
        let testEvent = Data("""
{\"event\": {\"event_timestamp_ms\": 1665577724112, \"product_id\": \"tier_1_0299_1m\", \"period_type\": \"NORMAL\", \"purchased_at_ms\": 1665577768000, \"expiration_at_ms\": 1665578068000, \"environment\": \"SANDBOX\", \"entitlement_id\": null, \"entitlement_ids\": [\"premium\"], \"presented_offering_id\": null, \"transaction_id\": \"2000000xxxxxxx\", \"original_transaction_id\": \"2000000xxxxxxx\", \"is_family_share\": false, \"country_code\": \"IE\", \"app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"aliases\": [\"079d31e3-315d-4506-a85e-xxxXXXxxx\"], \"original_app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"currency\": \"EUR\", \"is_trial_conversion\": false, \"price\": 2.898, \"price_in_purchased_currency\": 2.99, \"subscriber_attributes\": {\"$attConsentStatus\": {\"value\": \"denied\", \"updated_at_ms\": 1665577476055}}, \"store\": \"APP_STORE\", \"takehome_percentage\": 0.7, \"offer_code\": null, \"tax_percentage\": 0.1118, \"commission_percentage\": 0.3, \"type\": \"RENEWAL\", \"id\": \"AE9639F7-6605-401D-B7FF-XXXXXXX\", \"app_id\": \"app-XXXXXxXX\"}, \"api_version\": \"1.0\"}
""".utf8)
        
        XCTAssertNoThrow(try JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent))
        
        let rcEvent:RevenueCatWebhook = try! JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent)
        
        
        XCTAssertEqual(rcEvent.apiVersion, "1.0")
        
        XCTAssertEqual(rcEvent.event.id, "AE9639F7-6605-401D-B7FF-XXXXXXX")
        XCTAssertNil(rcEvent.event.cancelReason)
        XCTAssertEqual(rcEvent.event.type, .RENEWAL)
        XCTAssertEqual(rcEvent.event.aliases, ["079d31e3-315d-4506-a85e-xxxXXXxxx"])
        XCTAssertEqual(rcEvent.event.appID, "app-XXXXXxXX")
        XCTAssertEqual(rcEvent.event.appUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertNil(rcEvent.event.autoResumeAtMS)
        XCTAssertEqual(rcEvent.event.commissionPercentage, 0.3)
        XCTAssertEqual(rcEvent.event.countryCode, "IE")
        XCTAssertEqual(rcEvent.event.currency, "EUR")
        XCTAssertEqual(rcEvent.event.entitlementIDS, ["premium"])
        XCTAssertEqual(rcEvent.event.environment, .SANDBOX)
        XCTAssertEqual(rcEvent.event.eventTimestampMS, 1665577724112)
        XCTAssertEqual(rcEvent.event.expirationAtMS, 1665578068000)
        XCTAssertNil(rcEvent.event.expirationReason)
        XCTAssertNil(rcEvent.event.gracePeriodExpirationAtMS)
        XCTAssertFalse(rcEvent.event.isFamilyShare)
        XCTAssertNotNil(rcEvent.event.isTrialConversion)
        XCTAssertFalse(rcEvent.event.isTrialConversion!)
        XCTAssertNil(rcEvent.event.newProductID)
        XCTAssertNil(rcEvent.event.offerCode)
        XCTAssertEqual(rcEvent.event.originalAppUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertEqual(rcEvent.event.originalTransactionID, "2000000xxxxxxx")
        XCTAssertEqual(rcEvent.event.periodType, .NORMAL)
        XCTAssertNil(rcEvent.event.presentedOfferingID)
        XCTAssertEqual(rcEvent.event.price, 2.898)
        XCTAssertEqual(rcEvent.event.priceInPurchasedCurrency, 2.99)
        XCTAssertEqual(rcEvent.event.productID, "tier_1_0299_1m")
        XCTAssertEqual(rcEvent.event.purchasedAtMS, 1665577768000)
        XCTAssertEqual(rcEvent.event.store, .APP_STORE)
        
        let anyCodableTest: AnyCodable = AnyCodable(["value": "denied", "updated_at_ms": 1665577476055])
        XCTAssertEqual(rcEvent.event.subscriberAttributes, ["$attConsentStatus": anyCodableTest])
        XCTAssertEqual(rcEvent.event.taxPercentage, 0.1118)
        XCTAssertEqual(rcEvent.event.transactionID, "2000000xxxxxxx")
        XCTAssertNil(rcEvent.event.transferredFrom)
        XCTAssertNil(rcEvent.event.transferredTo)
    }
    
    func testDecodePRODUCT_CHANGE(){
        let testEvent = Data("""
{\"event\": {\"event_timestamp_ms\": 1665579980069, \"product_id\": \"tier_1_0299_1m\", \"period_type\": \"NORMAL\", \"purchased_at_ms\": 1665579868000, \"expiration_at_ms\": 1665579971000, \"environment\": \"SANDBOX\", \"entitlement_id\": null, \"entitlement_ids\": [\"premium\"], \"presented_offering_id\": null, \"transaction_id\": \"2000000xxxxxxx\", \"original_transaction_id\": \"2000000xxxxxxx\", \"is_family_share\": false, \"country_code\": \"IE\", \"app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"aliases\": [\"079d31e3-315d-4506-a85e-xxxXXXxxx\"], \"original_app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"new_product_id\": \"tier_3_2599_1m\", \"currency\": \"EUR\", \"price\": 0.0, \"price_in_purchased_currency\": 0.0, \"subscriber_attributes\": {\"$attConsentStatus\": {\"value\": \"denied\", \"updated_at_ms\": 1665577476055}}, \"store\": \"APP_STORE\", \"takehome_percentage\": 0.7, \"offer_code\": null, \"tax_percentage\": 0.1118, \"commission_percentage\": 0.3, \"type\": \"PRODUCT_CHANGE\", \"id\": \"AE9639F7-6605-401D-B7FF-XXXXXXX\", \"app_id\": \"app-XXXXXxXX\"}, \"api_version\": \"1.0\"}
""".utf8)
        
        XCTAssertNoThrow(try JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent))
        
        let rcEvent:RevenueCatWebhook = try! JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent)
        
        
        XCTAssertEqual(rcEvent.apiVersion, "1.0")
        
        XCTAssertEqual(rcEvent.event.id, "AE9639F7-6605-401D-B7FF-XXXXXXX")
        XCTAssertNil(rcEvent.event.cancelReason)
        XCTAssertEqual(rcEvent.event.type, .PRODUCT_CHANGE)
        XCTAssertEqual(rcEvent.event.aliases, ["079d31e3-315d-4506-a85e-xxxXXXxxx"])
        XCTAssertEqual(rcEvent.event.appID, "app-XXXXXxXX")
        XCTAssertEqual(rcEvent.event.appUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertNil(rcEvent.event.autoResumeAtMS)
        XCTAssertEqual(rcEvent.event.commissionPercentage, 0.3)
        XCTAssertEqual(rcEvent.event.countryCode, "IE")
        XCTAssertEqual(rcEvent.event.currency, "EUR")
        XCTAssertEqual(rcEvent.event.entitlementIDS, ["premium"])
        XCTAssertEqual(rcEvent.event.environment, .SANDBOX)
        XCTAssertEqual(rcEvent.event.eventTimestampMS, 1665579980069)
        XCTAssertEqual(rcEvent.event.expirationAtMS, 1665579971000)
        XCTAssertNil(rcEvent.event.expirationReason)
        XCTAssertNil(rcEvent.event.gracePeriodExpirationAtMS)
        XCTAssertFalse(rcEvent.event.isFamilyShare)
        XCTAssertNil(rcEvent.event.isTrialConversion)
        XCTAssertEqual(rcEvent.event.newProductID, "tier_3_2599_1m")
        XCTAssertNil(rcEvent.event.offerCode)
        XCTAssertEqual(rcEvent.event.originalAppUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertEqual(rcEvent.event.originalTransactionID, "2000000xxxxxxx")
        XCTAssertEqual(rcEvent.event.periodType, .NORMAL)
        XCTAssertNil(rcEvent.event.presentedOfferingID)
        XCTAssertEqual(rcEvent.event.price, 0.0)
        XCTAssertEqual(rcEvent.event.priceInPurchasedCurrency, 0.0)
        XCTAssertEqual(rcEvent.event.productID, "tier_1_0299_1m")
        XCTAssertEqual(rcEvent.event.purchasedAtMS, 1665579868000)
        XCTAssertEqual(rcEvent.event.store, .APP_STORE)
        
        let anyCodableTest: AnyCodable = AnyCodable(["value": "denied", "updated_at_ms": 1665577476055])
        XCTAssertEqual(rcEvent.event.subscriberAttributes, ["$attConsentStatus": anyCodableTest])
        XCTAssertEqual(rcEvent.event.taxPercentage, 0.1118)
        XCTAssertEqual(rcEvent.event.transactionID, "2000000xxxxxxx")
        XCTAssertNil(rcEvent.event.transferredFrom)
        XCTAssertNil(rcEvent.event.transferredTo)
    }
    
    
    func testDecodeCANCELLATION(){
        let testEvent = Data("""
{\"event\": {\"event_timestamp_ms\": 1665580080050, \"product_id\": \"tier_3_2599_1m\", \"period_type\": \"NORMAL\", \"purchased_at_ms\": 1665579971000, \"expiration_at_ms\": 1665580271000, \"environment\": \"SANDBOX\", \"entitlement_id\": null, \"entitlement_ids\": [\"premium\"], \"presented_offering_id\": null, \"transaction_id\": \"2000000xxxxxxx\", \"original_transaction_id\": \"2000000xxxxxxx\", \"is_family_share\": false, \"country_code\": \"IE\", \"app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"aliases\": [\"079d31e3-315d-4506-a85e-xxxXXXxxx\"], \"original_app_user_id\": \"079d31e3-315d-4506-a85e-xxxXXXxxx\", \"cancel_reason\": \"UNSUBSCRIBE\", \"currency\": \"USD\", \"price\": 0.0, \"price_in_purchased_currency\": 0.0, \"subscriber_attributes\": {\"$attConsentStatus\": {\"value\": \"denied\", \"updated_at_ms\": 1665577476055}}, \"store\": \"APP_STORE\", \"takehome_percentage\": 0.7, \"offer_code\": null, \"tax_percentage\": 0.0, \"commission_percentage\": 0.3, \"type\": \"CANCELLATION\", \"id\": \"AE9639F7-6605-401D-B7FF-XXXXXXX\", \"app_id\": \"app-XXXXXxXX\"}, \"api_version\": \"1.0\"}
""".utf8)
        
        XCTAssertNoThrow(try JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent))
        
        let rcEvent:RevenueCatWebhook = try! JSONDecoder().decode(RevenueCatWebhook.self, from: testEvent)
        
        
        XCTAssertEqual(rcEvent.apiVersion, "1.0")
        
        XCTAssertEqual(rcEvent.event.id, "AE9639F7-6605-401D-B7FF-XXXXXXX")
        XCTAssertEqual(rcEvent.event.cancelReason, .UNSUBSCRIBE)
        XCTAssertEqual(rcEvent.event.type, .CANCELLATION)
        XCTAssertEqual(rcEvent.event.aliases, ["079d31e3-315d-4506-a85e-xxxXXXxxx"])
        XCTAssertEqual(rcEvent.event.appID, "app-XXXXXxXX")
        XCTAssertEqual(rcEvent.event.appUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertNil(rcEvent.event.autoResumeAtMS)
        XCTAssertEqual(rcEvent.event.commissionPercentage, 0.3)
        XCTAssertEqual(rcEvent.event.countryCode, "IE")
        XCTAssertEqual(rcEvent.event.currency, "USD")
        XCTAssertEqual(rcEvent.event.entitlementIDS, ["premium"])
        XCTAssertEqual(rcEvent.event.environment, .SANDBOX)
        XCTAssertEqual(rcEvent.event.eventTimestampMS, 1665580080050)
        XCTAssertEqual(rcEvent.event.expirationAtMS, 1665580271000)
        XCTAssertNil(rcEvent.event.expirationReason)
        XCTAssertNil(rcEvent.event.gracePeriodExpirationAtMS)
        XCTAssertFalse(rcEvent.event.isFamilyShare)
        XCTAssertNil(rcEvent.event.isTrialConversion)
        XCTAssertNil(rcEvent.event.newProductID)
        XCTAssertNil(rcEvent.event.offerCode)
        XCTAssertEqual(rcEvent.event.originalAppUserID, "079d31e3-315d-4506-a85e-xxxXXXxxx")
        XCTAssertEqual(rcEvent.event.originalTransactionID, "2000000xxxxxxx")
        XCTAssertEqual(rcEvent.event.periodType, .NORMAL)
        XCTAssertNil(rcEvent.event.presentedOfferingID)
        XCTAssertEqual(rcEvent.event.price, 0.0)
        XCTAssertEqual(rcEvent.event.priceInPurchasedCurrency, 0.0)
        XCTAssertEqual(rcEvent.event.productID, "tier_3_2599_1m")
        XCTAssertEqual(rcEvent.event.purchasedAtMS, 1665579971000)
        XCTAssertEqual(rcEvent.event.store, .APP_STORE)
        
        let anyCodableTest: AnyCodable = AnyCodable(["value": "denied", "updated_at_ms": 1665577476055])
        XCTAssertEqual(rcEvent.event.subscriberAttributes, ["$attConsentStatus": anyCodableTest])
        XCTAssertEqual(rcEvent.event.taxPercentage, 0.0)
        XCTAssertEqual(rcEvent.event.transactionID, "2000000xxxxxxx")
        XCTAssertNil(rcEvent.event.transferredFrom)
        XCTAssertNil(rcEvent.event.transferredTo)
    }
    
}
