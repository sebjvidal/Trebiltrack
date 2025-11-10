//
//  UIBarButtonItem+SetTargetAction.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

extension UIBarButtonItem {
    func setTarget(_ target: AnyObject?, action: Selector) {
        self.target = target
        self.action = action
    }
}
