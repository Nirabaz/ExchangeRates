//
//  BaseTableViewCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
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
    
    class func registerForTableView(aTableView: UITableView) {
        let nib = UINib(nibName: className, bundle:nil)
        aTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}
