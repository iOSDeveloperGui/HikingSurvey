//
//  ReponseComponent .swift
//  HikingSurvey
//
//  Created by iOS Developer on 25/11/25.
//

import SwiftUI

struct ResponseComponent: View {
    var response: Response
    
    var body: some View {
        HStack{
            Text(response.text)
                .padding(.trailing)
        
            Spacer()
            
            Image(systemName: response.sentiment.icon)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color(response.sentiment.sentimentColor))
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(.white)
        )
    }
}

