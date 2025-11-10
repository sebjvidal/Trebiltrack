//
//  UIPageViewController+SetViewControllers.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

extension UIPageViewController {
    func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, direction: .forward, animated: false)
    }
}
