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
    @State private var isShowingSheet: Bool = false
    @State private var rotationAngle: Double = 0
    
    
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
                            isShowingSheet.toggle()
                            
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
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
                    CustomCircleView()
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
        .rotation3DEffect(
            .degrees(rotationAngle),
            axis: (x: 0, y: 1, z: 0),
        )
        .scaleEffect(x: abs(cos(rotationAngle * .pi / 180)), y: 1)
        .opacity(Double(abs(cos(rotationAngle * .pi / 180))))

        .onTapGesture {
            withAnimation(.easeInOut(duration: 4)) {
               rotationAngle -= 360
            }
        }
    }
}

#Preview {
    CardView()
}
