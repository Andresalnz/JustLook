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
    
    @IBOutlet weak var stackViewCast: UIStackView!
    @IBOutlet weak var stackViewDirector: UIStackView!
    @IBOutlet weak var stackViewAct: UIStackView!
    
    //Information
    @IBOutlet weak var stackViewNote: UIStackView!
    
    @IBOutlet weak var stackViewYearRelease: UIStackView!
    @IBOutlet weak var stackViewGenres: UIStackView!
    
    @IBOutlet weak var stackViewLength: UIStackView!
    @IBOutlet weak var stackViewCountryProduction: UIStackView!
    
    //MARK: - Variables
    var presenter: DetailUIPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        style()
    }
    
    private func style() {
        //overview
        stackViewDetail.spacing = 20.0
        
        //Information
        stackViewInformationDetail.spacing = 20.0
        stackViewNote.spacing = 50.0
        stackViewYearRelease.spacing = 50.0
        stackViewGenres.spacing = 50.0
        stackViewLength.spacing = 50.0
        stackViewCountryProduction.spacing = 50.0
        
        //Reparto
        stackViewCast.spacing = 20.0
        stackViewDirector.spacing = 50.0
        stackViewAct.spacing = 20.0
        //Information
        let attributeText: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.red,
            .font: UIFont(name: "OpenSans-Bold", size: 20)!
        ]
        
        //Reparto
        
        lblTitleCredits.attributedText = NSAttributedString(string: "Reparto", attributes: attributeText)
        
        
        
        
        lblOriginalTitleDetail.font = UIFont(name: "OpenSans-Light", size: 20)
        lblOverview.font = UIFont(name: "OpenSans-Regular", size: 20)
        
        
        
    }
    
    func update(detailMovie: DetailMovieBO?, act: [DetailCreditsActMoviesBO]?, personal: [DetailPersonalMoviesBO]?) {
        guard let buildImage = Constants.buildImage else { return }
        guard let posterPath = detailMovie?.posterPath else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let image = URL(string: ("\(buildImage)\(posterPath)"))
        //Arrays
        var genres: [String] = []
        var countrys: [String] = []
        var directors: [String] = []
        var namesActors: [String] = []
        var personals: [String] = []
        
        
       
        imgDetail.kf.setImage(with: image)
        imgDetail.contentMode = .scaleToFill
        detailMovie?.genres?.forEach({ item in
            guard let genreName = item.name else  { return }
            genres.append(genreName)
        })
        
        detailMovie?.productionCountries?.forEach({ item in
            guard let countryNames = item.name else  { return }
            countrys.append(countryNames)
        })
        
        act?.forEach({ item in
            if item.knownForDepartment == .acting {
                guard let actorsNames = item.name else  { return }
                namesActors.append(actorsNames)
            }
        })
        
        //Title and original title
        lblTitleDetail.text = detailMovie?.title
        lblOriginalTitleDetail.text = detailMovie?.originalTitle
        
        //Overview
        lblOverview.text = detailMovie?.overview
        
        //Table util information
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
        
        //Casting
        
        lblDirector.text = "Director"
        lblActorsAndActresses.text = "Actores y Actrices"
        
        personal?.forEach({ item in
            if item.job == "Director" {
                directors.append(item.name!)
                
            }
            personals.append(item.name!)
            
        })
        lblResultDirector.text = directors.joined(separator: ", ")
        lblResultActorsAndActresses.text = namesActors.joined(separator: ", ")
    }
    
}

