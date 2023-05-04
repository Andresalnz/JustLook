//
//  PopularMovieCollectionViewCell.swift
//  JustLook
//
//  Created by Andres Aleu on 2/5/23.
//

import UIKit
import Kingfisher

class PopularMovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var imgIconImdb: UIImageView!
    @IBOutlet weak var lblNote: UILabel!
    
    
    static let identifier: String = "PopularCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        styles()
    }
    
    func styles() {
        lblNote.textColor = .white
       
    }
    
    func paintCell(item: ResultMovieBO) {
        guard let buildImage = Constants.buildImage else { return }
        guard let posterPath = item.posterPath else { return }
        let image = URL(string: ("\(buildImage)\(posterPath)"))
        imgMovie.kf.setImage(with: image)
        imgIconImdb.image = UIImage(named: "icon-imdb")
        lblNote.text = String(format: "%.1f", item.voteAverage!)
        
    }
    
    func paintCellSerie(item: ResultSerieBO) {
        guard let buildImage = Constants.buildImage else { return }
        guard let posterPath = item.posterPath else { return }
        let image = URL(string: ("\(buildImage)\(posterPath)"))
        imgMovie.kf.setImage(with: image)
        imgIconImdb.image = UIImage(named: "icon-imdb")
        lblNote.text = String(format: "%.1f", item.voteAverage!)
        
    }

}
