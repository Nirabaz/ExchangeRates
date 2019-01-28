//
//  NBURateTVCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class NBURateTVCell: BaseTableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Internal Variables
    
    override class var cellIdentifier: String {
        return "NBURateTVCell"
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
