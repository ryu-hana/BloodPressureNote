//
//  Color.swift
//  BloodPressureNote
//
//  Created by SugiuraArisa on 2021/06/26.
//

import UIKit

extension UIColor {
    class var accent_base: UIColor {
        return UIColor(named: "accent_base")!
    }
    
    class var accent_dark: UIColor {
        return UIColor(named: "accent_dark")!
    }
    
    class var accent_light: UIColor {
        return UIColor(named: "accent_light")!
    }
}

extension UIImage {
    /// - 色だけのUIImageを生成する
    class func colorImage(color: UIColor, size: CGSize, radius r: CGFloat?) -> UIImage {
        UIGraphicsBeginImageContext(size)

        let rect = CGRect(origin: .zero, size: size)
        if r != nil {
            UIBezierPath(roundedRect: rect, cornerRadius: r!).addClip()
        }
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image!
    }
}
