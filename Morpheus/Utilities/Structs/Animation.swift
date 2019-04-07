//
//  Animation.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 07/04/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public struct Animation {
    public let duration: TimeInterval
    public let closure: (UIView) -> Void
}

public extension Animation {
    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { $0.alpha = 1 })
    }
    
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { $0.bounds.size = size })
    }
}
