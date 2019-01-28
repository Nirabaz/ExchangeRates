//
//  ViewController.swift
//  ExchangeRates
//
//  Created by Mykhailo Zabarin on 1/27/19.
//  Copyright © 2019 Mykhailo Zabarin. All rights reserved.
//

import UIKit

class StartVC: BaseVC {
    
    //MARK: - IBOutlets
    
    //MARK: - Private Variables
    
    private var isPortraitOrientation: Bool = true
    private var privatCellHeight: CGFloat = 0
    private let sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 8.0, left: 1.0, bottom: 4.0, right: 1.0)
    private var privateVertLayoutCellHeight: CGFloat = 0
    
    //MARK: - Internal Variables
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    //MARK: - Private Functions
    
    private func getData() {
        if NetworkManager.sharedManager.isInternetReachable(){
            
        } else {
            Utils.showSimpleAlertWithMessage(message: "No Network Connection", title: "Error")
        }
    }
    
    private func registerCells() {
        BankCVCell.registerForCollectionView(aCollectionView: collectionView)
    }
    
    //MARK: - Internal Functions
    
    override func rotated() {
        switch UIApplication.shared.statusBarOrientation {
        case .portrait, .portraitUpsideDown:
            print("portait")
            isPortraitOrientation = true
            break
        case .landscapeLeft, .landscapeRight:
            print("landscaped")
            isPortraitOrientation = false
            break
        case .unknown:
            //default
            break
        }
        collectionView.reloadData()
    }
}

extension StartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = isPortraitOrientation ? 1 : 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        var heightPerItem: CGFloat = 0
        
        if indexPath.row == 0 {
            heightPerItem = isPortraitOrientation ? 44 * 5 : collectionView.frame.height - paddingSpace
            privatCellHeight = heightPerItem
        } else {
            heightPerItem = isPortraitOrientation ? collectionView.frame.height - privatCellHeight : collectionView.frame.height - paddingSpace
        }
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankCVCell.cellIdentifier, for: indexPath) as! BankCVCell
        if indexPath.row == 0{
            cell.isPrivat = true
        } else {
            cell.isPrivat = false
        }
        return cell
    }
    
    
    
    
}

