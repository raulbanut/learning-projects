//
//  ImageTableViewCell.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 24.08.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var movieDescription: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Variables
    static let identifier = "CustomTableViewCell"
    
    // MARK: - Functions
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell",
                     bundle: nil )
    }
    
    func configure(with model: Movie) {
        Task {
            var poster = UIImage(named: "")
            
            if let cachedImage = ImageCache.shared.image(forKey: model.imagePath) {
                poster = cachedImage
            } else {
                let image = try await API.getImage(posterPath: model.imagePath)
                
                if let image = image {
                    ImageCache.shared.setImage(image, forKey: model.imagePath)
                    poster = image
                }
            }
            
            DispatchQueue.main.async {
                self.movieDescription.text = model.overview
                self.movieImageView.image = poster
            }
        }
        
    }
}
