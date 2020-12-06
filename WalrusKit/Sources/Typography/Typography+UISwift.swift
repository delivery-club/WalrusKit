//
//  Typography.swift
//  WalrusKit
//
//  Created by Sakhey Ignatyev on 25.11.2020.
//

import SwiftUI

// MARK: - SwiftUI // WalrusText
@available(iOS 13.0, *)
extension Text: WalrusText {}

@available(iOS 13.0, *)
extension WalrusText where Self == Text {
    public func withColor(_ walrusColor: WalrusColor) -> Text {
        self.foregroundColor(walrusColor.color)
    }
}

// MARK: - SwiftUI // WalrusTextStyle
@available(iOS 13.0, *)
struct WalrusTextStyleSwiftUI: WalrusTextStyle {
    let font: Font
}

@available(iOS 13.0, *)
extension WalrusTextStyle where Self == WalrusTextStyleSwiftUI {
    func createWalrusText(_ string: String) -> Text {
        Text(string)
            .font(self.font)
    }
}

// MARK: - SwiftUI // Walrus Style Factory
// todo: implement, styles are here https://www.figma.com/file/cKpSI9Dy6CGjo2WJ3iYqYL/Walrus-Typography?node-id=0%3A1
@available(iOS 13.0, *)
struct WalrusTextFactorySwiftUI: WalrusTextFactory {
    func textStyleHeader(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Font.montserratFont(ofSize: 46, weight: .extrabold))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Font.montserratFont(ofSize: 30, weight: .extrabold))
        case .small:
            return WalrusTextStyleSwiftUI(font: Font.montserratFont(ofSize: 22, weight: .bold))
        }
    }

    func textStyleMain(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 15).weight(.bold))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 15).weight(.medium))
        case .small:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 15).weight(.regular))
        }
    }

    func textStyleSmall(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 12).weight(.bold))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 12).weight(.medium))
        case .small:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 12).weight(.regular))
        }
    }

    func textStyleExtraSmall(for size: Typography.Size) -> WalrusTextStyleSwiftUI {
        switch size {
        case .large:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 10).weight(.bold))
        case .medium:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 10).weight(.medium))
        case .small:
            return WalrusTextStyleSwiftUI(font: Font.system(size: 10).weight(.regular))
        }
    }
}

@available(iOS 13.0, *)
extension WalrusTextFactory where Self == WalrusTextFactorySwiftUI {
    func createStyle(kind: Typography.Kind) -> WalrusTextStyleSwiftUI {
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
