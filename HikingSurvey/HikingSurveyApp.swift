//
//  HikingSurveyApp.swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import SwiftUI

@main
struct HikingSurveyApp: App {
    @StateObject private var scorerViewModel = ScorerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(scorerViewModel)
        }
    }
}
