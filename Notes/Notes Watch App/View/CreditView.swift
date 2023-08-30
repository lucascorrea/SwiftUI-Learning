//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Lucas Correa on 30/08/2023.
//

import SwiftUI

struct CreditView: View {

    @State private var randomNumber: Int = Int.random(in: 1..<4)

    private var randomImage: String {
        "developer-no\(randomNumber)"
    }

    var body: some View {
        VStack(spacing: 3) {

            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            HeaderView(title: "Credits")
                .padding(.bottom, 20)
            
            Text("Robert Petras")
                .foregroundColor(.primary)
                .fontWeight(.bold)

            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
