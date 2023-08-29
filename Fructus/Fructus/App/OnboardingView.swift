//
//  OnboardingView.swift
//  Fructus
//
//  Created by Lucas Correa on 20/08/2023.
//

import SwiftUI

struct OnboardingView: View {

    // MARK: - Properties

    var fruits: [Fruit] = fruitsData
//    @State var animate: Bool = false

    // MARK: - Body

    var body: some View {
        TabView {
            ForEach(fruits, id: \.id) { fruit in
                FruitCardView(fruit: fruit)
            }
        }
        .tabViewStyle(.page)
        .padding(.vertical, 20)

//        ZStack {
//            Color.black
//                .ignoresSafeArea()
//            Image("apple")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 200, height: 200)
//                .rotation3DEffect(Angle(degrees: animate ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//                .onTapGesture {
//                    withAnimation(
//                        .interpolatingSpring(stiffness: 30, damping: 3)) {
//                            animate.toggle()
//                        }
//                }
//        }

    }
}

// MARK: - Preview

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
