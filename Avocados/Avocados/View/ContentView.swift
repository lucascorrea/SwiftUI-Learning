//
//  ContentView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct ContentView: View {

    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData

    @State private var showHeadline: Bool = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(showHeadline: $showHeadline,
                                       header: item)
                        }
                    }
                }

                Text("Avocados Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())

                DishesView()
                    .frame(maxWidth: 640)

                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }

                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())

                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)

                VStack(alignment: .center, spacing: 20) {
                    Text("All about Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
            }
            .padding(.bottom, 85)
        }
        .onAppear {
            print("ContentView appear")
            showHeadline.toggle()
        }
        .onDisappear {
            showHeadline.toggle()
        }
        .ignoresSafeArea()
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
