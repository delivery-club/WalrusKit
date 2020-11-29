//
//  DesignSystem.swift
//  DeliveryClubUI
//
//  Created by Sakhey Ignatyev on 26.11.2020.
//

import SwiftUI
import UIKit

/// returns UIColor instance for given design system color
/// references could be found here https://www.figma.com/file/ss3FcJOyxTYvD685QKArIF/Walrus-Colors?node-id=1%3A1310
public func color(_ name: WalrusColor) -> UIColor {
    name.uiColor
}

/// returns NSAttributedString instance with attributes for given design typography style
/// references could be found here https://www.figma.com/file/cKpSI9Dy6CGjo2WJ3iYqYL/Walrus-Typography?node-id=0%3A1
public func text(_ string: String, with kind: Typography.Kind) -> NSAttributedString {
    WalrusTextFactoryUIKit().createStyle(kind: kind).createWalrusText(string)
}

/// returns NSAttributedString instance with attributes for given design typography style
/// references could be found here https://www.figma.com/file/cKpSI9Dy6CGjo2WJ3iYqYL/Walrus-Typography?node-id=0%3A1
public func text(for string: String?, with kind: Typography.Kind) -> NSAttributedString? {
    guard let string = string else { return nil }
    return WalrusTextFactoryUIKit().createStyle(kind: kind).createWalrusText(string)
}

/// returns Color value for given design system color
/// references could be found here https://www.figma.com/file/ss3FcJOyxTYvD685QKArIF/Walrus-Colors?node-id=1%3A1310
@available(iOS 13.0, *)
public func color(_ name: WalrusColor) -> Color {
    name.color
}

/// returns styled Text value for given design typography style
/// references could be found here https://www.figma.com/file/cKpSI9Dy6CGjo2WJ3iYqYL/Walrus-Typography?node-id=0%3A1
@available(iOS 13.0, *)
public func text(_ string: String, with kind: Typography.Kind) -> SwiftUI.Text {
    WalrusTextFactorySwiftUI().createStyle(kind: kind).createWalrusText(string)
}
