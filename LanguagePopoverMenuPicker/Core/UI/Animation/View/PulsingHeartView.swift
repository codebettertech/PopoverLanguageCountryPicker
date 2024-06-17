//
//  PulsingHeartView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import SwiftUI

struct PulsingHeartView: View {
    /*#-code-walkthrough(6.heartPulse)*/
    @State private var heartPulse: CGFloat = 1
    /*#-code-walkthrough(6.heartPulse)*/
    var body: some View {
        HeartShape()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .scaleEffect(heartPulse)
            .shadow(color: .pink, radius: 10)
            .onAppear{
                /*#-code-walkthrough(7.heartPulse)*/
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    /*#-code-walkthrough(8.heartPulse)*/
                    heartPulse = 1.25 * heartPulse
                    /*#-code-walkthrough(8.heartPulse)*/
                    /*#-code-walkthrough(7.heartPulse)*/
                }
            }
    }
}

#Preview {
    PulsingHeartView()
}
