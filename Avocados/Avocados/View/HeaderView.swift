//
//  HeaderView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct HeaderView: View {

    @Binding var showHeadline: Bool
    var header: Header
    var slideAnimation: Animation {
        .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
        .speed(1)
        .delay(0.25)
    }

    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFit()

            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)

                VStack(alignment: .leading, spacing: 6) {
                    Text(header.headline)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)

                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
            .background(Color("ColorBlackTransparentLight"))
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadline ? 75 : 220)
            .animation(slideAnimation, value: showHeadline)
            .onAppear {
                showHeadline.toggle()
                print("HeaderView appear")
            }
        }
        .frame(height: 320, alignment: .center)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showHeadline: .constant(false), header: headersData[0])
            .previewLayout(.sizeThatFits)
    }
}
