//
//  MontserratFont.swift
//  Delivery Club Resources
//
//  Created by a.skorobogatov on 22.05.2020.
//  Copyright © 2020 Delivery Club. All rights reserved.
//

import UIKit
import SwiftUI

public class MontserratFont {

    private enum Constants {
        static let fileTypes = "ttf"
    }

    public enum Weight: CaseIterable {
        case bold, regular, light, medium, semibold, extrabold

        var fontName: String {
            switch self {
            case .bold: return "Montserrat-Bold"
            case .regular: return "Montserrat-Regular"
            case .light: return "Montserrat-Light"
            case .medium: return "Montserrat-Medium"
            case .semibold: return "Montserrat-SemiBold"
            case .extrabold: return "Montserrat-ExtraBold"
            }
        }
    }

    static func register () {
        MontserratFont.Weight.allCases.forEach({
            do {
                try Fonts.registerFontName($0.fontName, ofType: Constants.fileTypes)
            } catch {
                fatalError()
            }
        })
    }
}

extension UIFont {
    static func montserratFont(ofSize fontSize: CGFloat, weight: MontserratFont.Weight) -> UIFont {
        return UIFont(name: weight.fontName, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }

    //MARK: - Objective-C Adapter
    @available(swift, obsoleted: 1.0)
    @objc public static func montserratExtraBold(ofSize fontSize: CGFloat) -> UIFont {
        return .montserratFont(ofSize: fontSize, weight: .extrabold)
    }
}

@available(iOS 13.0, *)
extension Font {
    static func montserratFont(ofSize fontSize: CGFloat, weight: MontserratFont.Weight) -> Font {
        return .custom(weight.fontName, size: fontSize)
    }
}
