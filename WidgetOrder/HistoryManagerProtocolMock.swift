//
//  HistoryManagerProtocolMock.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import Foundation

struct Order {
    let deliveryTime: String
    let orderStatus: String
    let statusEmoji: String
}

protocol HistoryManagerProtocol: class {
    func fetchLastActiveOrder(completion: @escaping (Result<Order, Error>) -> Void)
}

class HistoryManagerProtocolMock: HistoryManagerProtocol {
    func fetchLastActiveOrder(completion: @escaping (Result<Order, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(5)
            DispatchQueue.main.async {
                let order = Order(
                    deliveryTime: "15:00-15:10",
                    orderStatus: "Курьер идет к вам",
                    statusEmoji: "🥣")
                completion(.success(order))
            }
        }
    }
}
