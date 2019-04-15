//
//  Extensions.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

typealias UIAlertActionHandler = () -> Void?

extension UIViewController {
    func showAlert(title: String, message: String, style: UIAlertController.Style = .alert, actionHandler: UIAlertActionHandler? = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            actionHandler?()
        }
        
        alertController.addAction(okayAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    class func generateRandomColor() -> UIColor {
        return UIColor(rgb: Int(CGFloat(arc4random()) / CGFloat(UINT32_MAX) * 0xFFFFFF))
    }
}
