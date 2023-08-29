//
//  ContentView.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import SwiftUI

struct ContentView: View {

    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false

    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    func gridSwitch() {
        let count = gridLayout.count % 3 + 1
        gridLayout = Array(repeating: .init(.flexible()), count: count)
        gridColumn = gridLayout.count
    }

    func gridToolbarIconSwitch() {
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImgeView()
                            .frame(height: 300)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                            .listRowBackground(Color.clear)
                        }
//                        CreditsView()
//                            .modifier(CenterModfifer())
                        HStack {
                            Spacer()
                            CreditsView()
                            Spacer()
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            print("List view is Activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }

                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            withAnimation(.easeIn) {
                                gridSwitch()
                            }
                            gridToolbarIconSwitch()
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
