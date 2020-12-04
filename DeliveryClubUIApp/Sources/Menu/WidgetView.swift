//
//  WidgetView.swift
//  DeliveryClubUIApp
//
//  Created by Aleksandr Anosov on 01.12.2020.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {

    var body: some View {
        Button("Update widget") {
            if #available(iOS 14.0, *) {
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
    }
}
