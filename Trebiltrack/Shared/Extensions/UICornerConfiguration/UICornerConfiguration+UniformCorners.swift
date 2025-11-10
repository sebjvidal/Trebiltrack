//
//  UICornerConfiguration+UniformCorners.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

extension UICornerConfiguration {
    static func uniformCorners(_ radius: CGFloat) -> UICornerConfiguration {
        return .uniformCorners(radius: .fixed(radius))
    }
}
