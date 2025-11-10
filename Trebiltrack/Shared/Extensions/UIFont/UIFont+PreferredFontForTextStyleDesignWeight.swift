//
//  UIFont+PreferredFontForTextStyleDesignWeight.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit
import Obfuscate

extension UIFont {
    static func preferredFont(forTextStyle textStyle: TextStyle, design: UIFontDescriptor.SystemDesign = .default, weight: Weight = .regular) -> UIFont {
        let methodType = (@convention(c) (NSObject.Type, Selector, TextStyle, UIFontDescriptor.SystemDesign, Weight) -> UIFont).self
        let string = #Obfuscate("_preferredFontForTextStyle:design:weight:")
        let selector = NSSelectorFromString(string)
        
        guard responds(to: selector) else { return .preferredFont(forTextStyle: textStyle) }
        
        let implementation = method(for: selector)
        let method = unsafeBitCast(implementation, to: methodType)
        
        return method(self, selector, textStyle, design, weight)
    }
}
