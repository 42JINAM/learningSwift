//
//  CardView.swift
//  Hike
//
//  Created by Private on 06/05/2025.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - Header
                VStack (alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 52, weight: .black, design: .default))
                            .foregroundStyle(
                                LinearGradient(colors:
                                                [.colorGrayLight,
                                                 .colorGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom
                                              )
                                
                            )
                        Spacer()
                        
                        Button {
                           print("The button was pressed")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                } //: Header
                .padding(.horizontal, 30)
                //MARK: - main content
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(.colorIndigoMedium),
                                    Color(.colorSaimonLight)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)
                    Image("image-1")
                        .resizable()
                        .scaledToFit()
                }
                //MARK: - footer
            }
        } //: Card
        .frame(maxWidth: 320, maxHeight: 570)
    }
}

#Preview {
    CardView()
}
