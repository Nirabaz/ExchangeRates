//
//  HeaderTVCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class HeaderTVCell: BaseTableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Internal Variables
    
    override class var cellIdentifier: String {
        return "HeaderTVCell"
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBactions
    
    @IBAction func onChangeDateBtnPress(sender: UIButton) {
        
    }
    
    // MARK: - Internal Functions
    
    //    override func configureCellWithModel(){
    //    }
    
    // MARK: - Private Functions
    
}
