//
//  ColorsView.swift
//  DeliveryClubUIApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import DeliveryClubUI
import SwiftUI

struct ColorsView: View {

    private enum Constants {
        static let columnsCount: Int = 3
        static let vSpacing: CGFloat = 10
        static let hSpacing: CGFloat = 10
        static let side: CGFloat = UIScreen.main.bounds.width / 3 - 20
    }

    private let colors: [(color: UIColor, name: String, textColor: Color)] = [
        (color: .blancPrimary, name: "Primary", textColor: .black),
        (color: .textSecondaryLow, name: "Secondary Low", textColor: .white),
        (color: .blancSecondary, name: "Secondary", textColor: .white),
        (color: .blancSecondaryHigh, name: "Secondary High", textColor: .white),
        (color: .blancDcGreenLow, name: "DC Green Low", textColor: .white),
        (color: .blancDcGreen, name: "DC Green", textColor: .white),
        (color: .blancDcGreenHigh, name: "DC Green High", textColor: .white),
        (color: .blancError, name: "Error", textColor: .white),
        (color: .blancAttention, name: "Attention", textColor: .white),
        (color: .blancAccent, name: "Accent", textColor: .secondary),
        (color: .blancAccentLightGray, name: "Accent\nLightGray", textColor: .secondary),
        (color: .blancAccentGray, name: "Accent\nGray", textColor: .white),
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            GridStack(
                itemsNumber: colors.count,
                columns: Constants.columnsCount,
                vSpacing: Constants.vSpacing,
                hSpacing: Constants.hSpacing) { index in

                if let index = index {
                    Text(colors[index].name)
                        .font(.system(.headline, design: .rounded))
                        .bold()
                        .foregroundColor(colors[index].textColor)
                        .frame(width: Constants.side, height: Constants.side)
                        .background(Color(colors[index].color))
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}
