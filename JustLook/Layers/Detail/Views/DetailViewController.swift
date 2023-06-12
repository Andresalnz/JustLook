//
//  DetailViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, DetailUI {
    
    //MARK: - IBOutlet
    @IBOutlet weak var scrollViewDetail: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var stackViewDetail: UIStackView!
    @IBOutlet weak var lblTitleDetail: UILabel!
    @IBOutlet weak var lblOriginalTitleDetail: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    
    @IBOutlet weak var stackViewInformationDetail: UIStackView!
    
    @IBOutlet weak var lblnote: UILabel!
    @IBOutlet weak var lblResultNote: UILabel!
    
    @IBOutlet weak var lblYearRelease: UILabel!
    @IBOutlet weak var lblResultYearRelease: UILabel!
    
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblResultGenres: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    
    @IBOutlet weak var lblResultLength: UILabel!
    @IBOutlet weak var lblCountryProduction: UILabel!
    
    @IBOutlet weak var lblResultCountryProduction: UILabel!
    
    //Reparto
    @IBOutlet weak var lblTitleCredits: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblResultDirector: UILabel!
    @IBOutlet weak var lblActorsAndActresses: UILabel!
    @IBOutlet weak var lblResultActorsAndActresses: UILabel!
    @IBOutlet weak var lblMoreCredits: UILabel!
    @IBOutlet weak var lblresultMoreCredits: UILabel!
    
    
    
    
    //MARK: - Variables
    var presenter: DetailUIPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        style()
    }
    
    private func style() {
        stackViewDetail.spacing = 9.0
        
        lblTitleDetail.font = UIFont(name: "OpenSans-Bold", size: 20)
        lblOriginalTitleDetail.font = UIFont(name: "OpenSans-Light", size: 20)
        lblOverview.font = UIFont(name: "OpenSans-Regular", size: 20)
        
        //Reparto
        lblTitleCredits.font = UIFont(name: "OpenSans-Bold", size: 20)
    }
    
    func update(detailMovie: DetailMovieBO?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        var genres: [String] = []
        var countrys: [String] = []
        detailMovie?.genres?.forEach({ item in
            guard let genreName = item.name else  { return }
            genres.append(genreName)
        })
        
        detailMovie?.productionCountries?.forEach({ item in
            guard let countryNames = item.name else  { return }
            countrys.append(countryNames)
        })
        lblTitleDetail.text = detailMovie?.title
        lblOriginalTitleDetail.text = detailMovie?.originalTitle
        lblOverview.text = detailMovie?.overview
        lblnote.text = "Valoración"
        lblResultNote.text = String(format: "%.1f de %u votos", (detailMovie?.voteAverage)!, (detailMovie?.voteCount)!)
        lblYearRelease.text = "Año de estreno"
        lblResultYearRelease.text = formatter.string(from: (detailMovie?.releaseDate)!)
        lblGenres.text = "Generos"
        lblResultGenres.text = genres.joined(separator: ", ")
        lblLength.text = "Duración"
        lblResultLength.text = String(format: "%.1f horas", (detailMovie?.runtime)! / 60)
        lblCountryProduction.text = "Pais de producción"
        lblResultCountryProduction.text = countrys.joined(separator: ", ")
   
        //Reparto
        lblTitleCredits.text = "Reparto"
        
    }
}
