//
//  InfoView.swift
//  JinamCard
//
//  Created by Private on 05/05/2025.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName).foregroundColor(.orange)
                    Text(text)
                        .foregroundColor(.black)
                }
            )
            .padding(.all)
    }
}


#Preview {
    InfoView(text: "hello", imageName: "phone.fill")
}
