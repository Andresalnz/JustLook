//
//  PopularMovieCollectionViewCell.swift
//  JustLook
//
//  Created by Andres Aleu on 2/5/23.
//

import UIKit
import Kingfisher

class PopularMovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IbOutlet
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var imgIconImdb: UIImageView!
    @IBOutlet weak var lblNote: UILabel!
    
    //MARK: - Variables
    static let identifier: String = "PopularCell"

    //MARK: - Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        styles()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblNote.text = nil
        lblNote.textColor = .black
    }
    
    //MARK: - Styles
    func styles() {
        lblNote.textColor = .black
       
    }
    
    //MARK: - Methods Paint Cell
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
    
    func paintCellSearch(item: ResultSearchBO) {
        guard let buildImage = Constants.buildImage else { return }
        guard let posterPath = item.posterPath else { return }
        let image = URL(string: ("\(buildImage)\(posterPath)"))
        imgMovie.kf.setImage(with: image)
        imgIconImdb.image = UIImage(named: "icon-imdb")
        lblNote.text = String(format: "%.1f", item.voteAverage!)
        if item.mediaType == MediaType.tv {
            lblNote.textColor = .purple
        }
        if item.mediaType == MediaType.person {
            lblNote.text = item.name
            
        }
        
    }

}
