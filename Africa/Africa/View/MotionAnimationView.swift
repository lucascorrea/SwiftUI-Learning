//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Lucas Correa on 28/08/2023.
//

import SwiftUI

struct MotionAnimationView: View {

    @State private var randowCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false

    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }

    func randomSize() -> CGFloat {
        CGFloat.random(in: 10...300)
    }

    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }

    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }

    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randowCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .onAppear {
                            withAnimation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())) {
                                    isAnimating = true
                                }
                        }
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
