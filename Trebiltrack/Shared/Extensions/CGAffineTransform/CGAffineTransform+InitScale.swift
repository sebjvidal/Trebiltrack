//
//  CGAffineTransform+InitScale.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import CoreGraphics

extension CGAffineTransform {
    init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
}
