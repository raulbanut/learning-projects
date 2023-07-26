//
//  CoolPeopleTableViewCell.swift
//  testApp
//
//  Created by Banut Raul on 21.07.2023.
//

import UIKit

class CoolPeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coolImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CoolPeopleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellIdentifier", for: indexPath) as? CoolPeopleCollectionViewCell {
            
            collectionCell.heightConstraint.constant = self.contentView.frame.height
            
            return collectionCell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
}
