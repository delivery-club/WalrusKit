//
//  Typography.swift
//  DeliveryClubUI
//
//  Created by Aleksandr Anosov on 06.12.2020.
//

import Foundation

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


