//
//  WidgetEntryView.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import SwiftUI
import WidgetKit

struct WidgetEntryView: View {

    let orderEntry: OrderEntry
    
    var body: some View {
        switch orderEntry.kind {
        case .order(let viewModel):
            OrderView(viewModel: viewModel)
        case .empty:
            EmptyView()
        }
    }
}
