//
//  PrivatRateTVCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class PrivatRateTVCell: BaseTableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    // MARK: - Internal Variables
    
    override class var cellIdentifier: String {
        return "PrivatRateTVCell"
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Internal Functions
    
    //    override func configureCellWithModel(){
    //    }
    
    // MARK: - Private Functions
    
}
