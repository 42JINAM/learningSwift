//
//  CardView.swift
//  Hike
//
//  Created by Private on 06/05/2025.
//

import SwiftUI

struct CardView: View {
    //MARK: - Properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1

    //MARK: - Functions
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while imageNumber == randomNumber
        imageNumber = randomNumber
    }

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
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                //MARK: - footer
                Button {
                    print(">>> Explore more")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .colorGreenLight,
                                    .colorGreenMedium
                                ], startPoint: .top, endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())

            }
        } //: Card
        .frame(maxWidth: 320, maxHeight: 570)
    }
}

#Preview {
    CardView()
}
