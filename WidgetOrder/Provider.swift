//
//  Provider.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import WidgetKit

struct Provider: TimelineProvider {

    typealias Entry = OrderEntry

    private enum Constants {
        static let statusUpdateTime = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
        static let defaultEmoji = "🥣"
    }

    func placeholder(in context: Context) -> OrderEntry {
        OrderEntry(date: Date(), kind: .empty)
    }

    func getSnapshot(in context: Context, completion: @escaping (OrderEntry) -> Void) {
        let viewModel = OrderStatusViewModel(
            title: "14:00-14:10",
            description: "Заказ готовится",
            emoji: Constants.defaultEmoji
        )
        let entry = OrderEntry(date: Date(), kind: .orderStatus(viewModel))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<OrderEntry>) -> Void) {
        getOrderStatusTimeline(completion: completion)
    }

    private func getOrderStatusTimeline(completion: @escaping (Timeline<OrderEntry>) -> Void) {
        let historyManager: HistoryManagerProtocol = HistoryManagerProtocolMock()

        historyManager.fetchLastActiveOrder { result in
            switch result {
            case let .success(order):
                let entry = OrderEntry(
                    date: Date(),
                    kind: .orderStatus(
                        .init(
                            title: order.deliveryTime,
                            description: order.orderStatus,
                            emoji: order.statusEmoji
                        )
                    )
                )
                let timeline = Timeline(entries: [entry], policy: .after(Constants.statusUpdateTime))
                completion(timeline)
            case .failure:
                getEmptyViewTimeline(completion: completion)
            }
        }
    }

    private func getEmptyViewTimeline(completion: @escaping (Timeline<OrderEntry>) -> Void) {
        let entry = OrderEntry(date: Date(), kind: .empty)
        completion(Timeline(entries: [entry], policy: .never))
    }
}
