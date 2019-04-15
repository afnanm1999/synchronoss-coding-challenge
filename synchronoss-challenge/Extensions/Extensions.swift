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
    class func generateRandomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
