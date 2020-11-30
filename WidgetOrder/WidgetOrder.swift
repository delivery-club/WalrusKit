//
//  WidgetOrder.swift
//  WidgetOrder
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import WidgetKit
import SwiftUI

@main
struct WidgetOrder: Widget {
    let kind: String = "WidgetOrder"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Статус заказа")
        .description("Подскажет, что происходит с заказом и во сколько приедет доставка.")
        .supportedFamilies([.systemSmall])
    }
}


struct WidgetOrder_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView(entry: OrderEntry(date: Date(), kind: .empty))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
