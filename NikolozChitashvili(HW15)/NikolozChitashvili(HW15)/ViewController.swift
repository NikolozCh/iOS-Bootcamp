//
//  ViewController.swift
//  NikolozChitashvili(HW15)
//
//  Created by Nikoloz Chitashvili on 12.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    private var movies = [
        Movie(title: "Batman", releaseDate: "1987", imdb: 8.9, mainActor: "Kriste Bale", seen: true, isFavourite: true),
        Movie(title: "Harry Potter", releaseDate: "1999", imdb: 9.2, mainActor: "Daniel Redcliff", seen: true, isFavourite: true),
        Movie(title: "Mglis fsikologia", releaseDate: "2009", imdb: 10.0, mainActor: "Ermalo Magradze", seen: true, isFavourite: false),
        Movie(title: "Gogris Dgiurebi", releaseDate: "2012", imdb: 4.9, mainActor: "Ronaldo Kurbidze", seen: false, isFavourite: false),
        Movie(title: "Bambito", releaseDate: "2018", imdb: 3.4, mainActor: "Folginio", seen: true, isFavourite: false),
        Movie(title: "Ferdikis Omebi", releaseDate: "2090", imdb: 5.6, mainActor: "Raywen Fereri", seen: false, isFavourite: false),
        Movie(title: "Messi VS Barca", releaseDate: "2000", imdb: 9.9, mainActor: "Messi Messovichi", seen: true, isFavourite: true),
        Movie(title: "Fruktozito", releaseDate: "2504", imdb: 8.3, mainActor: "Jansagi Tipi", seen: true, isFavourite: true),
        Movie(title: "Chemi ori dge", releaseDate: "2003", imdb: 9.9, mainActor: "Me da Me", seen: true, isFavourite: true),
        Movie(title: "Patara Fidos Cxovreba", releaseDate: "2098", imdb: 2.3, mainActor: "Hoho Rty", seen: false, isFavourite: true)
    ]
    
    lazy var seenMovies = movies.filter { $0.seen }
    lazy var notSeenYet = movies.filter { !$0.seen }
    
    var movieToShowDetails: Movie? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return movies.count - notSeenYet.count
        case 1:
            return notSeenYet.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.accessoryType = .disclosureIndicator
        
        
        switch indexPath.section {
        case 0:
            cell.movieTitle.text = seenMovies[indexPath.row].title
            cell.movieIMDBRating.text = String(seenMovies[indexPath.row].imdb)
        case 1:
            cell.movieTitle.text = notSeenYet[indexPath.row].title
            cell.movieIMDBRating.text = String(notSeenYet[indexPath.row].imdb)
        default:
            cell.movieTitle.text = "Exceuse me, you broke the phone"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Seen Movies"
        case 1:
            return "Not checked yet"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            movieToShowDetails = seenMovies[indexPath.row]
        case 1:
            movieToShowDetails = notSeenYet[indexPath.row]
        default:
            return
        }
        
        performSegue(withIdentifier: "ShowMovieDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMovieDetails" {
            let vc = segue.destination as! MovieDetailsViewController
            vc.delegate = self
            vc.movieToShow = movieToShowDetails
        }
    }
    
}


extension ViewController: MovieDetailsDelegate {
    func toggleFavorite() {
        if let movieToShowDetails = movieToShowDetails {
            if let onIndex = movies.firstIndex(where: { $0.title == movieToShowDetails.title }) {
                movies[onIndex].isFavourite = !movies[onIndex].isFavourite
                if movieToShowDetails.seen {
                    seenMovies = movies.filter { $0.seen }
                }
                else {
                    notSeenYet = movies.filter { !$0.seen }
                }
            }
        }
    }
}
