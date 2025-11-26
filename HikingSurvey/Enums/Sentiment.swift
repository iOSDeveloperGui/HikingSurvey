//
//  Sentiment.swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import Foundation
import SwiftUI
import Charts

enum Sentiment: String, Plottable{
    case positive = "Positive"
    case negative = "Negative"
    case moderate = "Moderate"
    
    init(_ score: Double){
        if score > 0.4 {
            self = .positive
        } else if score < -0.4 {
            self = .negative
        } else {
            self = .moderate
        }
    }
    
    var icon: String{
        switch self {
        case .positive:
            return "chevron.up"
        case .negative:
            return "chevron.down"
        case .moderate:
            return "minus"
        }
    }
    
    var sentimentColor: Color{
        switch self {
        case .positive:
            return Color(red: 0.99, green: 0.49, blue: 0.00)
        case .negative:
            return Color(red: 0.08, green: 0.22, blue: 0.41)
        case .moderate:
            return Color(red: 0.00, green: 0.44, blue: 0.49)
        }
    }
}
