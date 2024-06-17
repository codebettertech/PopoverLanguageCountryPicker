//
//  ScaleImageAnimationView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import SwiftUI

struct ScaleImageAnimationView: View {
  @State private var pulsing = false

  var body: some View {
    VStack {
      Spacer()
      ZStack {
        if pulsing {
          PulsingHeartView()
        } else {
          ResetHeartView()
        }
      }
      Spacer()
      PlayResetButtonView(animating: $pulsing)
    }
    .navigationTitle("Basic Animation")
    .toolbarTitleDisplayMode(.inline)                                                                                                                                                                                                                                                                                    
  }
}

struct ScaleImageAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    ScaleImageAnimationView()
  }
}
