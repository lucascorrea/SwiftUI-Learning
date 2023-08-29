//
//  CoverImgeView.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import SwiftUI

struct CoverImgeView: View {

    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
                .onAppear {
                    print("Item \(item.name)")
                }
            }
        }
        .tabViewStyle(.page)

    }
}

struct CoverImgeView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImgeView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
