//
//  HistoryManagerProtocolMock.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import Foundation

struct Order: Codable {
    let deliveryTime: String
    let orderStatus: String
    let statusEmoji: String

    static var testOrders: [Order] {
        [
            Order(
                deliveryTime: "15:00-15:10",
                orderStatus: "Ждем ресторан",
                statusEmoji: "🕐"
            ),
            Order(
                deliveryTime: "15:00-15:10",
                orderStatus: "Готовится",
                statusEmoji: "🥣"
            ),
            Order(
                deliveryTime: "15:00-15:10",
                orderStatus: "Идем к вам",
                statusEmoji: "🏃"
            )
        ]
    }
}


protocol HistoryManagerProtocol: class {
    func fetchLastActiveOrder(completion: @escaping (Result<Order, Error>) -> Void)
}

enum OrderError: Error {
    case noOrder
}

class HistoryManagerProtocolMock: HistoryManagerProtocol {
    func fetchLastActiveOrder(completion: @escaping (Result<Order, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(5)
            DispatchQueue.main.async {
                let userDefaults = UserDefaults.standard
                let index = userDefaults.integer(forKey: "index")
                guard let nextIndex = self.nextIndex(for: index) else {
                    userDefaults.set(-1, forKey: "index")
                    completion(.failure(OrderError.noOrder))
                    return
                }
                userDefaults.set(nextIndex, forKey: "index")
                completion(.success(Order.testOrders[nextIndex]))
            }
        }
    }

    private func nextIndex(for index: Int) -> Int? {
        if index + 1 >= Order.testOrders.count {
            return nil
        } else {
            return index + 1
        }
    }
}
