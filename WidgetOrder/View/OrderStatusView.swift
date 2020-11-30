//
//  OrderStatusView.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import SwiftUI
import WidgetKit
import DeliveryClubUI

struct OrderStatusViewModel {
    let title: String
    let description: String
    let emoji: String
}

struct OrderStatusView: View {

    private enum Constants {
        static let spacingBetweenEmojiAndTexts: CGFloat = 8
        static let spacingBetweenTexts: CGFloat = 8
        static let padding: CGFloat = 16
    }

    let viewModel: OrderStatusViewModel

    var body: some View {
        ZStack {
            WalrusColor.primary.color
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: Constants.spacingBetweenEmojiAndTexts) {
                text(viewModel.emoji, with: .header(size: .large))
                VStack(spacing: Constants.spacingBetweenTexts) {
                    text(viewModel.title, with: .main(size: .large))
                    text(viewModel.description, with: .small(size: .medium))
                }
            }
            .padding(.all, Constants.padding)
        }
    }
}
