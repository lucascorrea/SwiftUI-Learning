//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct RecipeCardView: View {

    var recipe: Recipe
    @State private var showModal: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            Spacer()
                        }
                        .padding()
                    }
                }
            VStack(alignment: .leading, spacing: 12) {
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)

                Text(recipe.headline)
                    .font(.body)
                    .foregroundColor(.gray)
                    .italic()

                RecipeRatingView(recipe: recipe)

                RecipeCookingView(recipe: recipe)

            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            showModal.toggle()
        }
        .sheet(isPresented: $showModal) {
            RecipeDetailView(recipe: recipe)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
