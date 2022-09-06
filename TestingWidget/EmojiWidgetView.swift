//
//  EmojiWidgetView.swift
//  TestingWidgetExtension
//
//  Created by Александр on 06.09.2022.
//

import SwiftUI

struct EmojiWidgetView: View {

  let emojiDetails: EmojiDetails

  var body: some View {
    ZStack {
      Color(UIColor.systemIndigo)
      VStack {
        Text(emojiDetails.emoji)
          .font(.system(size: 56))
        Text(emojiDetails.name)
          .font(.headline)
          .multilineTextAlignment(.center)
          .padding(.top, 5)
          .padding([.leading, .trailing])
          .foregroundColor(.white)
      }
    }
  }
}

