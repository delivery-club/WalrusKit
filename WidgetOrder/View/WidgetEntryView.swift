//
//  WidgetEntryView.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import WidgetKit
import SwiftUI

struct WidgetEntryView: View {

    var entry: OrderEntry

    var body: some View {
        switch entry.kind {
        case .orderStatus(let viewModel):
            OrderStatusView(viewModel: viewModel)
        case .empty:
            EmptyView()
        }
    }
}
