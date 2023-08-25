//
//  ViewController.swift
//  ChallengeTwoBlurHeader
//
//  Created by Banut Raul on 26.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var normalImageView: UIImageView!
    @IBOutlet weak var blurredImageView: UIImageView!
    
    @IBOutlet weak var blurTop: NSLayoutConstraint!
    @IBOutlet weak var imageTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let headerHeight = normalImageView.bounds.height
        
        print("offsetY \(offsetY) || headerHeight \(headerHeight)")
        
        // Calculate the progress of scrolling (0 when at the top, 1 when scrolled completely away)
        let progress = max(0, min(1, (offsetY * 2 + headerHeight) / headerHeight))
        
        let scale = max(1.0, (headerHeight - offsetY) / headerHeight)
        let maxScale = 1.3
        print("scale \(scale) || maxScale \(maxScale)")
        let minScale = min(scale, maxScale)
        
        // Fix the image, set the top constraint constant
        let newTopConstant = max(offsetY, -headerHeight)
        imageTop.constant = newTopConstant
        blurTop.constant = newTopConstant
        
        // Zoom In
        blurredImageView.transform = CGAffineTransform(scaleX: minScale, y: minScale)
        normalImageView.transform = CGAffineTransform(scaleX: minScale, y: minScale)
        
        // Update the alpha value of the blurred image view based on the scrolling progress
        normalImageView.alpha = progress
        
    }
}

