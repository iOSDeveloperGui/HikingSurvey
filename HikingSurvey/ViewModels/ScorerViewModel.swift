//
//  Scores.swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import Foundation
import NaturalLanguage

class ScorerViewModel: ObservableObject{
    @Published var responses: [Response] = []
    
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    let sampleResponse: [String] = [
        "The outdoors is my happy place, so give me a trail and some boots and I feel great!",
        "I don't mind going for a walk, but hiking requires too much gear and planning.",
        "Hiking seems like a pretty good way to stay in shape.",
        "I love everything about hiking: the fresh air, the exercise, the feeling of accomplishment. When can we go next?",
        "There’s a nice, paved trail near my house that I like, but I don't need to get out in the woods.",
        "I enjoy hard hikes. When my heart is pumping and I'm being challenged, I feel great.",
        "Last time I went hiking I got a thousand bug bites. You won't find me on a trail any time soon!"
    ]
    
    func score(_ text: String) -> Double{
        var sentimentScore: Double = 0.0
        
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph,
            scheme: .sentimentScore,
            options: []) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue,
                   let score = Double(sentimentString){
                    sentimentScore = score
                    return true
                }
                return false
            }
        return sentimentScore
    }
    
    func saveResponse(text: String){
        let score = self.score(text)
        let response = Response(text: text, score: score)
        responses.insert(response, at: 0)
    }
}
