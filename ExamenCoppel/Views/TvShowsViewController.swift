//
//  TvShowsViewController.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation
import UIKit

//MARK: - TvShowsViewController - Class
class TvShowsViewController: UIViewController, TvShowsPresenterDelegate{
    
    @IBOutlet weak var menuAppButton: UIButton!
    @IBOutlet weak var segmentTvShows: UISegmentedControl!
    @IBOutlet weak var tvShowsCollection: UICollectionView!
    @IBOutlet weak var activityCollectionTv: UIActivityIndicatorView!
    private let tvShowCellWith = ((UIScreen.main.bounds.width-40)/2)
    private let tvShowsPresenter = TvShowsPresenter()
    private var tvShowsList = [TvShowModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityCollectionTv.hidesWhenStopped = true
        self.navigationItem.hidesBackButton = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Do any additional setup after loading the view.
        tvShowsCollection.dataSource = self
        tvShowsCollection.delegate = self
        tvShowsCollection.register(UINib(nibName: "TvShowsCell", bundle: nil), forCellWithReuseIdentifier: "tvShowCell")
        segmentTvShows.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        tvShowsPresenter.setViewDelegate(delegate: self)
        tvShowsPresenter.getTvShowsPopular()
    }
    @IBAction func showAppMenu(_ sender: Any) {
        print("Here it will display the menu")
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    //Detectar los cambios en el segment
    @IBAction func segmentActionChange(_ sender: Any) {
        activityCollectionTv.startAnimating()
        switch segmentTvShows.selectedSegmentIndex {
        case 0:
            tvShowsPresenter.getTvShowsPopular()
        case 1:
            tvShowsPresenter.getTvShowsTopRated()
        case 2:
            tvShowsPresenter.getTvShowsOnTV()
        case 3:
            tvShowsPresenter.getTvShowsAiringToday()
        default:
            print("Opción incorrecta")
        }
    }
    //Presenter Delegate
    func presentTvShows(tvShows: [TvShowModel]) {
        self.tvShowsList = tvShows
        DispatchQueue.main.async {
            self.tvShowsCollection.reloadData()
            self.activityCollectionTv.stopAnimating()
        }
    }
}

//MARK: - UICollectionViewDataSource
//Esta parte controla al collectionView
extension TvShowsViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(tvShowsList.count==0){
            return 0
        }
        return tvShowsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = tvShowsCollection.dequeueReusableCell(withReuseIdentifier: "tvShowCell", for: indexPath) as? TvShowsCell
        if(tvShowsList.count>0){
            cell!.tvShowName.text = tvShowsList[indexPath.row].name
            cell!.tvShowDescription.text = tvShowsList[indexPath.row].overview
            cell!.tvShowDate.text = tvShowsList[indexPath.row].first_air_date
            cell!.tvShowRate.text = "\(tvShowsList[indexPath.row].vote_average!)"
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
extension TvShowsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tvShowCellWith, height: 350)
    }
}
