//
//  WalrusColor.swift
//  DeliveryClubUI
//
//  Created by Sakhey Ignatyev on 26.11.2020.
//

import UIKit

extension WalrusColor {
    public var uiColor: UIColor {
        switch self {
        case .primary:
            return .mainPrimary
        case .secondaryHigh:
            return .mainSecondaryHigh
        case .secondaryDefault:
            return .mainSecondaryDefault
        case .secondaryLow:
            return .mainSecondaryLow
        case .dcHigh:
            return .mainDCHigh
        case .dcDefault:
            return .mainDCDefault
        case .dcLow:
            return .mainDCLow
        case .error:
            return .mainError
        case .attention:
            return .mainAttention
        case .accent96:
            return .accent96
        case .accent90:
            return .accent90
        case .accent85:
            return .accent85
        case .accent75:
            return .accent75
        case .accent60:
            return .accent60
        }
    }
}
