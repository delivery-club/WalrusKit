//
//  Typography.swift
//  DeliveryClubUI
//
//  Created by Sakhey Ignatyev on 25.11.2020.
//

public enum Typography {
    public enum Kind {
        case header(size: Size)
        case main(size: Size)
        case small(size: Size)
        case extraSmall(size: Size)
    }

    public enum Size {
        case large
        case medium
        case small
    }
}

protocol WalrusTextFactory { }

public protocol WalrusText { }

protocol WalrusTextStyle { }
