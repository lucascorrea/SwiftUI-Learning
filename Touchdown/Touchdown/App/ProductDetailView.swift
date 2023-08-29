//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Lucas Correa on 29/08/2023.
//

import SwiftUI

struct ProductDetailView: View {

    @EnvironmentObject var shop: Shop


    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, safeAreaTop)

            HeaderDetailView()
                .padding(.horizontal)

            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)

            VStack(alignment: .center, spacing: 6) {

                RatingSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)

                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }

                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)

                AddToCartDetailView()
                    .padding(.bottom, 20)
            }
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )

        }
        .zIndex(0)
        .ignoresSafeArea()
        .background(
            Color(red: shop.selectedProduct?.red ?? sampleProduct.red, green: shop.selectedProduct?.green ?? sampleProduct.green, blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
        ).ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
            .environmentObject(Shop())
    }
}
