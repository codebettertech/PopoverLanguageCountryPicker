//
//  ResetHeartView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import SwiftUI

struct ResetHeartView: View {
  var body: some View {
    HeartShape()
      .frame(width: 100, height: 100)
      .foregroundColor(.red)
      .shadow(color: .pink, radius: 10)
      .frame(width: 300, height: 300)
  }
}

#Preview {
  ResetHeartView()
}
