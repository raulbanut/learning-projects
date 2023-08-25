//
//  DetailsViewController.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 24.08.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var posterView: UIImageView!
    @IBOutlet var saveAsFavoriteButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLeftBarIcon()
        
        saveAsFavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    // MARK: - Variables
    static let identifier = "DetailsViewController"
    var isFavorite = false
    var movie: Movie?
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        isFavorite.toggle()
        
        let image = UIImage(systemName: isFavorite ? "star.fill" : "star")
        saveAsFavoriteButton.setImage(image, for: .normal)
        
        Task {
            if let movie = movie {
                try await API.postFavorite(movieId: movie.id)
            }
        }
    }
    
    // MARK: - Functions
    static func nib() -> UINib {
        return UINib(nibName: "DetailsViewController",
                     bundle: nil)
    }
    
    func configure(with model: Movie) {
        movie = model
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
                self.dateLabel.text = "Release date: \(model.releaseDate)"
                self.ratingLabel.text = "Vote average: \(model.voteAverage.description)"
                self.posterView.image = poster
            }
        }
    }
    
    func configureLeftBarIcon() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
