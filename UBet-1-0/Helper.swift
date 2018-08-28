//
//  Helper.swift
//  UBet-1-0
//
//  Created by Sam Boley on 7/10/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static func createAlert(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        view.present(alert, animated: true, completion:nil)
    }
}


