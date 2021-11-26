//
//  ProfileViewController.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    
    private var tvShowsList = [TvShowModel] ()
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var favoriteShows: UICollectionView!
    private let tvShowCellWith = ((UIScreen.main.bounds.width-20)/2)
    override func viewDidLoad() {
        favoriteShows.dataSource = self
        favoriteShows.delegate = self
        favoriteShows.register(UINib(nibName: "TvShowsCell", bundle: nil), forCellWithReuseIdentifier: "tvShowCell")
    }
    
    func presentTvShows(tvShows: [TvShowModel]) {
        self.tvShowsList = tvShows
        DispatchQueue.main.async {
            self.favoriteShows.reloadData()
        }
    }
}
//MARK: - UICollectionViewDataSource
//Esta parte controla al collectionView
extension ProfileViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoriteShows.dequeueReusableCell(withReuseIdentifier: "tvShowCell", for: indexPath) as? TvShowsCell
        if(tvShowsList.count>0){
            cell!.tvShowName.text = tvShowsList[indexPath.row].name
                if let imgurl = tvShowsList[indexPath.row].poster_path{
                    let url = URL(string: "https://image.tmdb.org/t/p/original/\(imgurl)")
                    let data = try? Data(contentsOf: url!)
                    cell!.tvShowImage.image = UIImage(data: data!)
                }

        }
        return cell!
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
//Esta extension sirve para darle una medida dinamica al tamaño de las celdas
extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tvShowCellWith, height: 350)
    }
}
