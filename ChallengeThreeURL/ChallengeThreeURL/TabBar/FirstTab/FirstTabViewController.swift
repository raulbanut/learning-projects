//
//  FirstTabViewController.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 23.08.2023.
//

import UIKit

class FirstTabViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        fetchMovies()
    }
    
    // MARK: - Variables
    var movies = [Movie]()
    
    // MARK: - Functions
    func fetchMovies() {
        Task {
            do {
                let newMovies = try await API.getNowPlaying()
                
                DispatchQueue.main.async {
                    self.movies.removeAll()
                    self.movies.append(contentsOf: newMovies)
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }
    }
}

extension FirstTabViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell {
            cell.configure(with: movies[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            detailsViewController.navigationItem.title = movies[indexPath.row].title
            detailsViewController.configure(with: movies[indexPath.row])
            
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension FirstTabViewController: UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {
            fetchMovies()
            return
        }
        
        let filteredMovies = filterMovies(with: searchTerm)
        
        for movie in filteredMovies {
            dump(movie)
        }
        
        movies = filteredMovies
        tableView.reloadData()
    }
    
    private func filterMovies(with searchTerm: String) -> [Movie] {
        let filteredMovies = movies.filter { movie in
            return movie.title.localizedCaseInsensitiveContains(searchTerm)
        }
        return filteredMovies
    }
}

