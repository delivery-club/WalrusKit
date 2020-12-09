//
//  EmptyView.swift
//  WidgetOrderExtension
//
//  Created by Aleksandr Anosov on 09.12.2020.
//

import SwiftUI
import WalrusKit
import WidgetKit

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 8) {
            text("🍽", with: .header(size: .large))
            text("Нет активных заказов", with: .main(size: .large))
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView().previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
