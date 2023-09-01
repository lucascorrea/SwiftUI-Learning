//
//  AvocadosView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct AvocadosView: View {
    @State private var pulseAnimation: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                Image("background")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("avocado")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 240, alignment: .center)
                        .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y:8)
                        .scaleEffect(pulseAnimation ? 1 : 0.9)
                        .opacity(pulseAnimation ? 1 : 0.9)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: pulseAnimation)
                    
                    VStack {
                        Text("Avocados".uppercased())
                            .font(.system(size: 42, weight: .bold, design: .serif))
                            .foregroundColor(.white)
                            .padding()
                            .shadow(color: Color("ColorBlackTransparentDark"),  radius: 4, x: 0, y:4)
                        Text("""
    Creamy, green, and full of nutrients!
    Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
    """)
                        .lineLimit(nil)
                        .font(.headline)
                        .foregroundColor(Color("ColorGreenLight"))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .frame(maxWidth: 640, minHeight: 120)
                    }
                    .padding()
                    
                    Spacer()
                }
                .onAppear {
                    pulseAnimation.toggle()
                    print("AvocadosView appear")
                }
            }
        }
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
        //            .environment(\.colorScheme, .dark)
    }
}
