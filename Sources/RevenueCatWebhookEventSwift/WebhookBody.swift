//
//  File.swift
//  
//
//  Created by mufumade on 10.10.22.
//

import Foundation

public struct RevenueCatWebhook: Codable {
    public let apiVersion: String
    public let event: Event

    public enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case event
    }
}
