//
//  Response.swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import Foundation

struct Response: Identifiable{
    var id: UUID = UUID()
    var text: String
    var score: Double
    
    var sentiment: Sentiment{
        Sentiment(score)
    }
}
