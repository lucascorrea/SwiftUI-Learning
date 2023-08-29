//
//  GalleryView.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import SwiftUI

struct GalleryView: View {

    let animals: [Animal] = Bundle.main.decode("animals.json")

    @State private var selectAnimal: String = "lion"
    @State private var animate: Bool = false

    // Simple grid
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]

    // Efficient grid definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    let haptics = UIImpactFeedbackGenerator(style: .medium)

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 8)
                    }

                // Slider

                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectAnimal = item.image
                                haptics.impactOccurred()
                            }

                    }
                }
                .onAppear {
                    withAnimation(.easeInOut) {
                        gridSwitch()
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
