//
//  BaseCollectionViewCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
     @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Internal Variables
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    //MARK: - Public Methods
    
    func configureCellWithModel(aModel: AnyObject?) {
        //need to be overriden in subclass
    }
    
    //MARK: - Public Methods
    
    //MARK: - Class Methods
    
    class var className: String {
        return String(describing: self)
    }
    
    class var cellIdentifier: String {
        assertionFailure("Method 'cellIdentifier' need to be overriden in SELBaseCollectionViewCell subclass")
        return ""
    }
    
    class func nibName() -> String {
        return String(describing: className).components(separatedBy: ".").last!
    }
    
    class func registerForCollectionView(aCollectionView: UICollectionView) {
        let nib = UINib(nibName: className, bundle:nil)
        aCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
}
