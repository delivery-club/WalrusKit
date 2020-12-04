//
//  EmptyView.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import WidgetKit
import SwiftUI
import DeliveryClubUI

struct EmptyView: View {
    enum Constants {
        static let emoji = "🍽"
        static let padding: CGFloat = 16
        static let spacingBetweenEmojiAndTexts: CGFloat = 8
    }

    var body: some View {
        ZStack {
            WalrusColor.primary.color
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: Constants.spacingBetweenEmojiAndTexts) {
                text(Constants.emoji, with: .header(size: .large))
                text("Нет активных заказов", with: .main(size: .large))
                    .multilineTextAlignment(.center)
            }
            .padding(.all, Constants.padding)
        }
    }
}
