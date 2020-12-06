//
//  Typography+SwiftUI.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 06.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct WalrusTextStyleSwiftUI {
    let font: Font

    func createWalrusText(_ string: String) -> Text {
        Text(string).font(font)
    }
}

@available(iOS 13.0, *)
struct WalrusTextFactorySwiftUI {
    func createStyle(for kind: Typography.Kind) -> WalrusTextStyleSwiftUI {
        switch kind {
        case let .header(size):
            return textStyleHeader(for: size)
        case let .main(size):
            return textStyleMain(for: size)
        case let .small(size):
            return textStyleSmall(for: size)
        case let .extraSmall(size):
            return textStyleExtraSmall(for: size)
        }
    }

    private func textStyleHeader(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Fonts.montserrat(.extrabold).size(46))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Fonts.montserrat(.extrabold).size(30))
        case .small:
            return WalrusTextStyleSwiftUI(font: Fonts.montserrat(.bold).size(22))
        }
    }

    private func textStyleMain(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.bold).size(15))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.medium).size(15))
        case .small:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.regular).size(15))
        }
    }

    private func textStyleSmall(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.bold).size(12))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.medium).size(12))
        case .small:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.regular).size(12))
        }
    }

    private func textStyleExtraSmall(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.bold).size(10))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.medium).size(10))
        case .small:
            return WalrusTextStyleSwiftUI(font: Fonts.system(.regular).size(10))
        }
    }
}
