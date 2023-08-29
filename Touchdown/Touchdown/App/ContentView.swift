//
//  ContentView.swift
//  Touchdown
//
//  Created by Lucas Correa on 29/08/2023.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var shop: Shop

    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, safeAreaTop)
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .frame(minHeight: 256)
                                .padding(.vertical, 20 )

                            CategoryGridView()

                            TitleView(title: "Helmets")

                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut) {
                                                shop.showingProduct = true
                                                shop.selectedProduct = product
                                            }
                                        }
                                }
                            }
                            .padding(15)

                            TitleView(title: "Brands")

                            BrandGridView()

                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                }
                .background(colorBackground.ignoresSafeArea())
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 14 Pro")
            ContentView()
                .previewDevice("iPhone 8")
        }
        .environmentObject(Shop())
    }
}
