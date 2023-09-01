//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Lucas Correa on 01/09/2023.
//

import SwiftUI

struct RipeningStagesView: View {

    @State private var slideInAnimation: Bool = false

    var ripeningStages: [Ripening] = ripeningData

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RipeningView(ripening: stage, slideInAnimation: $slideInAnimation)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                .padding(.bottom, 90)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}
