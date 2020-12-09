//
//  WidgetOrder.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import WidgetKit
import SwiftUI

@main
struct WidgetOrder: Widget {
    let kind = "WidgetOrder"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: OrderEntryProvider()) { entry in
            WidgetEntryView(orderEntry: entry)
        }
        .configurationDisplayName("Статус заказа")
        .description("Подскажет, что происходит с заказом и во сколько ждать доставку")
        .supportedFamilies([.systemSmall])
    }
}
