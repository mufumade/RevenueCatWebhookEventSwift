//
//  PeriodType.swift
//  
//
//  Created by mufumade on 10.10.22.
//

import Foundation


public enum PeriodType: String, Codable{
    /// For free trials.
    case TRIAL
    
    
    /// For introductory pricing.
    case INTRO
    
    /// Standard subscription.
    case NORMAL
    
    /// For subscriptions granted through RevenueCat.
    case PROMOTIONAL
}
