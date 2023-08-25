//
//  ImageCache.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 25.08.2023.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private let fileManager = FileManager.default
    private lazy var cacheDirectory: URL = {
        let urls = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("ImageCache")
    }()
    
    private init() {
        createCacheDirectoryIfNeeded()
    }
    
    private func createCacheDirectoryIfNeeded() {
        do {
            try fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error creating cache directory: \(error)")
        }
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        
        // Save the image to the cache directory
        let imagePath = cacheDirectory.appendingPathComponent(key)
        if let data = image.jpegData(compressionQuality: 1.0) {
            do {
                try data.write(to: imagePath)
            } catch {
                print("Error saving image to cache directory: \(error)")
            }
        }
    }
    
    func image(forKey key: String) -> UIImage? {
        // First, check the in-memory cache
        if let cachedImage = cache.object(forKey: key as NSString) {
            return cachedImage
        }
        
        // If not in memory, try to load from the cache directory
        let imagePath = cacheDirectory.appendingPathComponent(key)
        if let data = try? Data(contentsOf: imagePath),
           let image = UIImage(data: data) {
            return image
        }
        
        return nil
    }
}
