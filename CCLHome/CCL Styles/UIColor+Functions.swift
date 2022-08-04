//
//  UIColor+Functions.swift
//  UiByJsonPOC
//
//  Created by Gustavo Dario Conde on 04/07/2019.
//  Copyright © 2019 Gustavo Dario Conde. All rights reserved.
//

import UIKit

extension UIColor {

    /// UIColor init from integer values between 0-255.
    /// It takes 3 Int (0-255) values, then  map it to (0.0 - 1.0)
    /// - Parameters:
    ///   - red: amount of red component. It should be a value between 0 and 255
    ///   - green: amount of green component. It should be a value between 0 and 255
    ///   - blue: amount of blue component. It should be a value between 0 and 255
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    /// UIColor init from hexa int.
    ///
    /// - Parameter rgb: rgb color in hexa value, e.g. 0x535353
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    public static let carnivalLightNavy = UIColor(red: 16, green: 84, blue: 155)
    public static let carnivalUltralightNavy = UIColor(red: 0, green: 102, blue: 255)
    public static let australiaGray = UIColor(red: 247, green: 247, blue: 247)
    public static let carnivalGray = UIColor(red: 148, green: 148, blue: 148)
    public static let carnivalSeparatorGray = UIColor(red: 173, green: 173, blue: 173)
    public static let carnivalUltraLightGray = UIColor(red: 236, green: 236, blue: 236)
    public static let carnivalLightGray = UIColor(red: 113, green: 113, blue: 115)
    public static let carnivalDarkGray = UIColor(red: 89, green: 89, blue: 89)
    public static let carnivalBlueText = UIColor(red: 8, green: 66, blue: 133)
    public static let greyishBrownThree = UIColor(red: 83, green: 83, blue: 83)
    public static let carnivalTextGray = UIColor(red: 74, green: 74, blue: 74)
    public static let carnivalGrayToBorder = UIColor(red: 231, green: 231, blue: 231)
    public static let carnivalGrayBackground = UIColor(red: 210, green: 209, blue: 207)
    public static let carnivalButtonBorder = UIColor(red: 148, green: 148, blue: 148)
    public static let carnivalGraySeparator = UIColor(red: 225, green: 225, blue: 225)
    public static let stingrays = UIColor(red: 255, green: 127, blue: 175)
    public static let cerulean = UIColor(red: 0, green: 113, blue: 193)
    public static let lightBlueTabBarItemSelect = UIColor(red: 108, green: 214, blue: 253)
    public static let ligthBlueSeparator = UIColor(red: 76, green: 201, blue: 240)
    public static let carnivalRed = UIColor(red: 216, green: 13, blue: 28)
    public static let notificationBackground = UIColor(red: 237, green: 237, blue: 237)
    public static let noImageGray = UIColor(red: 216, green: 216, blue: 216)
    public static let carnivalGold = UIColor(red: 252, green: 185, blue: 52)
    public static let carnivalSilverLight = UIColor(red: 188, green: 202, blue: 207)
    public static let carnivalBlueLight = UIColor(red: 0, green: 113, blue: 193)
    public static let successGreenBanner = UIColor(red: 0, green: 130, blue: 133)
    public static let warningYellowBanner = UIColor(red: 251, green: 176, blue: 52)
    public static let alertRedText = UIColor(red: 230, green: 0, blue: 0)
    public static let safetyViewBackGround = UIColor(red: 0, green: 168, blue: 79)
    public static let carnivalTextBlack = UIColor(red: 0, green: 0, blue: 0)

    internal func imageFromColor() -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(cgColor)
            context.fill(CGRect(origin: .zero, size: size))
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    public convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            self.init(rgb: 0)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
