//
//  UIImageView+Extension.swift
//  Assesment
//
//  Created by mayanak on 22/02/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// Set icon to the Image View
    /// Configuration added for downsampling the image and saving to cache
    /// - Parameter urlString: URL string
    func setIcon(usingURL urlString: String) {
        let url = URL(string: urlString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
}
