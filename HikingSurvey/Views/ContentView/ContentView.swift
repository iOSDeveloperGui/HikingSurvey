//
//  ContentView.swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: ScorerViewModel
    @FocusState private var textFieldIsFocused: Bool
    @State private var responseText = ""
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 16)
            
            ScrollView(.vertical, showsIndicators: false){
                ChartView(responses: viewModel.responses)
                    
                
                ForEach(viewModel.responses){ response in
                    ResponseComponent(response: response)
                }
            }
            
            HStack{
                TextField("What do you think about Hiking?", text: $responseText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4)
                
                Button(action: {
                    guard !responseText.isEmpty else { return }
                    viewModel.saveResponse(text: responseText)
                    responseText = ""
                    textFieldIsFocused = false
                }, label:{
                    Text("Done")
                        .padding(.horizontal, 4)
                })
                
                .padding(.bottom, 4)
            }
        }
        .padding(.horizontal, 16)
        .background(Color(white: 0.95))
        .onAppear{
            for response in viewModel.sampleResponse{
                viewModel.saveResponse(text: response)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ScorerViewModel())
}
