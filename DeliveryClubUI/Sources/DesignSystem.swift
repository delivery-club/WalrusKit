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

/// returns Color value for given design system color
/// references could be found here https://www.figma.com/file/ss3FcJOyxTYvD685QKArIF/Walrus-Colors?node-id=1%3A1310
@available(iOS 13.0, *)
public func color(_ name: WalrusColor) -> Color {
    name.color
}

