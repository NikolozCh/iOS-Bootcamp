//
//  MovieDetailsViewController.swift
//  NikolozChitashvili(HW15)
//
//  Created by Nikoloz Chitashvili on 12.07.22.
//

import UIKit

protocol MovieDetailsDelegate {
    func toggleFavorite()
}

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieDateLbl: UILabel!
    @IBOutlet weak var movieIMDBRatingLbl: UILabel!
    @IBOutlet weak var movieMainActorLbl: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    @IBOutlet weak var seenImage: UIImageView!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var movieToShow: Movie? = nil
    var delegate: MovieDetailsDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard
            let movieForSure = movieToShow
        else {
            return
        }
        
        movieTitleLbl.text = movieForSure.title
        movieIMDBRatingLbl.text  = String(movieForSure.imdb)
        movieMainActorLbl.text = movieForSure.mainActor
        movieDateLbl.text = movieForSure.releaseDate
        movieDescriptionTextView.text = movieForSure.description
        
        if movieForSure.seen {
            seenImage.image = UIImage(systemName: "eye.fill")
        }
        
        if movieForSure.isFavourite {
            favoriteImage.image = UIImage(systemName: "star.fill")
        }
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        favoriteImage.isUserInteractionEnabled = true
        favoriteImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        // Your action
        if let _ = movieToShow {
            movieToShow!.isFavourite = !movieToShow!.isFavourite
        }
        
        if movieToShow!.isFavourite {
            favoriteImage.image = UIImage(systemName: "star.fill")
        }
        else {
            favoriteImage.image = UIImage(systemName: "star")
        }
        delegate?.toggleFavorite()
    }

}
