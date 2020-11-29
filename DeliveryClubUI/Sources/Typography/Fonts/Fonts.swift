//
//  Fonts.swift
//  Delivery Club Resources
//
//  Created by a.skorobogatov on 22.05.2020.
//  Copyright © 2020 Delivery Club. All rights reserved.
//

import SwiftUI
import UIKit

public enum Fonts {
    case system(UIFont.Weight)
    case italicSystem
    case montserrat(MontserratFont.Weight)

    public func size(_ size: CGFloat) -> UIFont {
        switch self {
        case let .system(weight): return .systemFont(ofSize: size, weight: weight)
        case .italicSystem: return .italicSystemFont(ofSize: size)
        case let .montserrat(weight): return .montserratFont(ofSize: size, weight: weight)
        }
    }
}

//MARK: - Register Fonts

extension Fonts {

    enum Error: Swift.Error {
        case resource
        case data
        case register(String)
    }

    static func registerFontName(_ fontName: String, ofType: String) throws {
        class Foo {}
        guard let path = Bundle(for: Foo.self).path(forResource: fontName, ofType: ofType) else {
            throw Error.resource
        }

        guard let fontData = NSData(contentsOfFile: path),
              let dataProvider = CGDataProvider.init(data: fontData),
              let font = CGFont.init(dataProvider) else {
            throw Error.data
        }

        var error: Unmanaged<CFError>?

        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            throw Error.register(error.debugDescription)
        }
    }
    
    public static func registerCustomFonts() {
        MontserratFont.register()
    }
    
}

//MARK: - Objective-C Adapter

extension UIFont {

    @available(swift, obsoleted: 1.0)
    @objc
    public static func font(ofSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        Fonts.system(weight).size(ofSize)
    }
}

//MARK: - SwiftUI
@available(iOS 13.0, *)
extension Fonts {
    public func size(_ size: CGFloat) -> Font {
        Font(self.size(size))
    }
}
