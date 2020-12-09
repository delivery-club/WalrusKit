//
//  OrderView.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import SwiftUI
import WalrusKit
import WidgetKit

struct OrderViewModel {
    let emoji: String
    let title: String
    let description: String
}

struct OrderView: View {

    let viewModel: OrderViewModel

    var body: some View {
        VStack(spacing: 8) {
            text(viewModel.emoji, with: .header(size: .large))
            text(viewModel.title, with: .main(size: .large))
            text(viewModel.description, with: .small(size: .medium))
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = OrderViewModel(emoji: "🥣", title: "14:00-14:10", description: "Заказ готовится")
        OrderView(viewModel: viewModel).previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
