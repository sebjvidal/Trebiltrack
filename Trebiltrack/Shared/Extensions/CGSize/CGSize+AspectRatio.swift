//
//  CGSize+AspectRatio.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import CoreGraphics

extension CGSize {
    var aspectRatio: CGFloat {
        return width / height
    }
}
