//
//  Utils.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class Utils {
    
    //MARK: - TOP VIEWCONTROLLER
    
    static func topViewController(base: UIViewController? = APP_DELEGATE.window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    static func showSimpleAlertWithMessage(message: String, title: String) {
        guard let topVC = Utils.topViewController(), !topVC.isKind(of: UIAlertController.self) else {
            return
        }
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert )
        alertVC.view.tintColor = UIColor.blue
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            alertVC.dismiss(animated: true, completion: nil)
        }
        
        alertVC.addAction(actionCancel)
        
        topVC.present(alertVC, animated: true, completion: nil)
    }
}
