//
//  SectionTableViewCell.swift
//  MovieLix
//
//  Created by Banut Raul on 25.07.2023.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    var sectionDataSource: [Movie]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieIdentifier", for: indexPath) as? MovieCollectionViewCell {
            
            let item = sectionDataSource[indexPath.row]
            
            cell.titleLabel.text = item.title
            cell.imageView.image = UIImage(named: item.imageName)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
}
