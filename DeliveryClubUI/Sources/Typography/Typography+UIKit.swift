//
//  Typography+UIKit.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 06.12.2020.
//

import UIKit

struct WalrusTextStyleUIKit {
    let font: UIFont

    func createWalrusText(_ string: String) ->  NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        return NSAttributedString(string: string, attributes: attributes)
    }
}

struct WalrusTextFactoryUIKit {
    func createStyle(for kind: Typography.Kind) -> WalrusTextStyleUIKit {
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

    private func textStyleHeader(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.extrabold).size(46))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.extrabold).size(30))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.bold).size(22))
        }
    }

    private func textStyleMain(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.system(.bold).size(15))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.system(.medium).size(15))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.system(.regular).size(15))
        }
    }

    private func textStyleSmall(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.system(.bold).size(12))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.system(.medium).size(12))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.system(.regular).size(12))
        }
    }

    private func textStyleExtraSmall(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.system(.bold).size(10))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.system(.medium).size(10))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.system(.regular).size(10))
        }
    }
}

