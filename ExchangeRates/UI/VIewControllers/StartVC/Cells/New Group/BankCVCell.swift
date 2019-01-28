//
//  BankCVCell.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/28/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class BankCVCell: BaseCollectionViewCell {

    // MARK: - IBOutlets
    
    // MARK: - Internal Variables
    
    var isPrivat: Bool = false
    
    override class var cellIdentifier: String {
        return "BankCell"
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
    }
    
    // MARK: - Internal Functions
    
//    override func configureCellWithModel(){
//    }
    
    // MARK: - Private Functions
    
    private func registerCells() {
        HeaderTVCell.registerForTableView(aTableView: tableView)
        PrivatRateTVCell.registerForTableView(aTableView: tableView)
        NBURateTVCell.registerForTableView(aTableView: tableView)
    }
    
}

extension BankCVCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderTVCell.cellIdentifier) as! HeaderTVCell
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isPrivat{
            let cell = tableView.dequeueReusableCell(withIdentifier: PrivatRateTVCell.cellIdentifier) as! PrivatRateTVCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NBURateTVCell.cellIdentifier) as! NBURateTVCell
            return cell
        }
        return UITableViewCell()
    }
    
    
}
