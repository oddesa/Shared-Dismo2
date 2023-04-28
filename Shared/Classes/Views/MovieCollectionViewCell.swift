//
//  MovieCollectionViewCell.swift
//  Dismo 2
//
//  Created by Jehnsen Hirena Kane on 14/04/23.
//

import UIKit

public class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = UIImage(systemName: "film.fill")
    }
    
    public func setupContent(_ url: URL?) {
        movieImageView.setImageWithPlaceholder(url: url, systemPlaceholder: "film.fill")
    }
}
