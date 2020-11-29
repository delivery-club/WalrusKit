//
//  Typography.swift
//  DeliveryClubUI
//
//  Created by Sakhey Ignatyev on 25.11.2020.
//

import UIKit

// MARK: - UIKit // WalrusText
extension NSAttributedString: WalrusText {}

extension WalrusText where Self: NSAttributedString {
    public func withColor(_ color: WalrusColor) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.addAttribute(.foregroundColor, value: color.uiColor, range: NSRange(location: 0, length: mutable.length))
        return mutable
    }
}

// MARK: - UIKit // WalrusTextStyle
struct WalrusTextStyleUIKit: WalrusTextStyle {
    let font: UIFont
}

extension WalrusTextStyle where Self == WalrusTextStyleUIKit {
    func createWalrusText(_ string: String) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: self.font,
        ]
        return NSAttributedString(string: string, attributes: attributes)
    }
}

// MARK: - UIKit // Walrus Style Factory

// todo: implement, styles are here https://www.figma.com/file/cKpSI9Dy6CGjo2WJ3iYqYL/Walrus-Typography?node-id=0%3A1
struct WalrusTextFactoryUIKit: WalrusTextFactory {

    func textStyleHeader(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.extrabold).size(46))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.extrabold).size(30))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.montserrat(.bold).size(22))
        }
    }

    func textStyleMain(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.system(.bold).size(15))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.system(.medium).size(15))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.system(.regular).size(15))
        }
    }

    func textStyleSmall(for size: Typography.Size) -> WalrusTextStyleUIKit {
        switch size {
        case .large:
            return WalrusTextStyleUIKit(font: Fonts.system(.bold).size(12))
        case .medium:
            return WalrusTextStyleUIKit(font: Fonts.system(.medium).size(12))
        case .small:
            return WalrusTextStyleUIKit(font: Fonts.system(.regular).size(12))
        }
    }

    func textStyleExtraSmall(for size: Typography.Size) -> WalrusTextStyleUIKit {
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

extension WalrusTextFactory where Self == WalrusTextFactoryUIKit {
    func createStyle(kind: Typography.Kind) -> WalrusTextStyleUIKit {
        switch kind {
        case let .header(size):
            return self.textStyleHeader(for: size)
        case let .main(size):
            return self.textStyleMain(for: size)
        case let .small(size):
            return self.textStyleSmall(for: size)
        case let .extraSmall(size):
            return self.textStyleExtraSmall(for: size)
        }
    }
}
