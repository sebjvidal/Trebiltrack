//
//  CGSize+OutsetBy.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

extension CGSize {
    func outset(by insets: UIEdgeInsets) -> CGSize {
        let width = width + insets.horizontal
        let height = height + insets.vertical
        
        return CGSize(width: width, height: height)
    }
}
