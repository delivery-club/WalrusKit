//
//  OrderEntry.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import WidgetKit

struct OrderEntry: TimelineEntry {
    var date: Date
    let kind: Kind

    enum Kind {
        case order(OrderViewModel)
        case empty
    }
}
