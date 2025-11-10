//
//  UIPageViewController+Init.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

extension UIPageViewController {
    convenience init(transitionStyle: TransitionStyle) {
        self.init(transitionStyle: transitionStyle, navigationOrientation: .horizontal, options: nil)
    }
}
