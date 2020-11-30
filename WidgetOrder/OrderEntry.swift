//
//  OrderEntry.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 29.11.2020.
//

import WidgetKit

struct OrderEntry: TimelineEntry {
    let date: Date
    let kind: Kind

    enum Kind {
        case orderStatus(OrderStatusViewModel)
        case empty
    }
}
