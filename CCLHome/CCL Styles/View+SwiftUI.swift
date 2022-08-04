//
//  View+SwiftUI.swift
//  CCLoyalty
//
//  Created by Felipe Gomez on 7/4/22.
//  Copyright © 2022 Carnival Cruise Lines. All rights reserved.
//

import SwiftUI

extension View {
    func cclFont(name: CCLFont, size: Double, color: UIColor = UIColor.black) -> some View {
        self.modifier(ScaledFont(name: name.name, size: size, color: color.convertUIColor()))
    }
}
                                 
extension UIColor {
    func convertUIColor() -> Color? {
        if #available(iOS 15.0, *) {
            return Color(self)
        }
        var red: CGFloat = 0
                var green: CGFloat = 0
                var blue: CGFloat = 0
                var opacity: CGFloat = 0
                guard self.getRed(&red, green: &green, blue: &blue, alpha: &opacity) else {
                    return Color.yellow
                }
        return Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(opacity))
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: Double
    var color: Color?
    
    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize)).foregroundColor(color)
    }
}
