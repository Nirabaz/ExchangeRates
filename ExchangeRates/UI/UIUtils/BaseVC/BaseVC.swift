//
//  BaseVC.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    //MARK: - Inside Variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var additionalSectionsAtStart: Int = 0
    var bgndTapGestureRecognizer: UITapGestureRecognizer?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeBgndTapGestureRecognizer()
        listenNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotifications()
        removeBgndTapGestureRecognizer()
        view.endEditing(true)
    }
    
    //MARK: - Private
    
    func listenNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(BaseVC.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func removeNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    // MARK: - NSNotifications
    
    @objc func rotated() {
        //override in child class
    }

}

extension BaseVC {
    

    
    func initializeBgndTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBgndTap(aRecognizer:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        bgndTapGestureRecognizer = tapGesture
    }
    
    func removeBgndTapGestureRecognizer() {
        if let tapGesture = bgndTapGestureRecognizer {
            view.removeGestureRecognizer(tapGesture)
        }
    }
    
    @objc func handleBgndTap(aRecognizer: UITapGestureRecognizer) {
        let rView = aRecognizer.view
        let location = aRecognizer.location(in: rView)
        let viewOfTouch = rView?.hitTest(location, with: nil)
        
        if !(viewOfTouch is UIButton) {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {return}
                strongSelf.view.endEditing(true)
            }
        }
        
        print("Handle tap in: \(self)")
    }
}

extension BaseVC: UIGestureRecognizerDelegate {
    
}
