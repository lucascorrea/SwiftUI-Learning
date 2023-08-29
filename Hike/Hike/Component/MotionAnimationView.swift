//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Lucas Correa on 18/07/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false

    // MARK: - FUNCTIONS

    //1. Random coordinate

    func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }

    //2. Random Size

    func randomSize() -> CGFloat {
        CGFloat.random(in: 4...80)
    }

    //3. Random Scale

    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }

    //4. Random speed

    func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }

    //5. Random delay

    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())) {
                                isAnimating = true
                            }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup() // High performance rendering
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(Circle().fill(.teal))
    }
}
