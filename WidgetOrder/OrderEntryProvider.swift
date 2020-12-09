//
//  OrderEntryProvider.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import WidgetKit

struct OrderEntryProvider: TimelineProvider {
    func placeholder(in context: Context) -> OrderEntry {
        OrderEntry(date: Date(), kind: .empty)
    }

    func getSnapshot(in context: Context, completion: @escaping (OrderEntry) -> Void) {
        let viewModel = OrderViewModel(emoji: "🥣", title: "14:00-14:10", description: "Заказ готовится")
        let entry = OrderEntry(date: Date(), kind: .order(viewModel))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<OrderEntry>) -> Void) {
        let viewModel = OrderViewModel(emoji: "🥣", title: "14:00-14:10", description: "Заказ готовится")
        let entry = OrderEntry(date: Date(), kind: .order(viewModel))
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
