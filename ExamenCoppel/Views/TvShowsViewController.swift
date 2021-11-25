//
//  TvShowsViewController.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation
import UIKit

//MARK: - TvShowsViewController - Class
class TvShowsViewController: UIViewController{
    
  
    @IBOutlet weak var menuAppButton: UIButton!
    @IBOutlet weak var segmentTvShows: UISegmentedControl!
    @IBOutlet weak var tvShowsCollection: UICollectionView!
    
    private let palabras = ["1","2","3","4","5","6","7","8"]
    private let tvShowCellWith = ((UIScreen.main.bounds.width-40)/2)
    private let tvShowsPresenter = TvShowsPresenter()
    private var tvShowsList: [TvShowModel]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvShowsCollection.dataSource = self
        tvShowsCollection.delegate = self
        tvShowsCollection.register(UINib(nibName: "TvShowsCell", bundle: nil), forCellWithReuseIdentifier: "tvShowCell")
        segmentTvShows.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
        //tvShowsList = tvShowsPresenter.getTvShowsPopular()
        getInfoTvShows(idSelected: "popular")
        print("in the view controller")
    }
    
    @IBAction func showAppMenu(_ sender: Any) {
        print("Here it will display the menu")
    }
    
    @IBAction func segmentActionChange(_ sender: Any) {
        
        switch segmentTvShows.selectedSegmentIndex {
        case 0:
            //tvShowsPresenter.getTvShowsPopular()
            getInfoTvShows(idSelected: "popular")
            print(segmentTvShows.titleForSegment(at: segmentTvShows.selectedSegmentIndex)!)
            
        case 1:
            //tvShowsPresenter.getTvShowsTopRated()
            getInfoTvShows(idSelected:
                            "top_rated")
            print(segmentTvShows.titleForSegment(at: segmentTvShows.selectedSegmentIndex)!)

        case 2:
            //tvShowsPresenter.getTvShowsOnTV()
            getInfoTvShows(idSelected: "on_the_air")
            print(segmentTvShows.titleForSegment(at: segmentTvShows.selectedSegmentIndex)!)
        case 3:
            //tvShowsPresenter.getTvShowsAiringToday()
            getInfoTvShows(idSelected: "airing_today")
            print(segmentTvShows.titleForSegment(at: segmentTvShows.selectedSegmentIndex)!)
        default:
            print("Have you done something new?")
        }
 
    }
    
    public func getInfoTvShows(idSelected: String?){
        NetworkinManager.shared.getTvShows(id: idSelected){ (tvShowModelList) in
            self.tvShowsList = tvShowModelList
            print(self.tvShowsList)
        }failure: { (error) in
            print("Error")
        }
    }
}

//MARK: - UICollectionViewDataSource
extension TvShowsViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return palabras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = tvShowsCollection.dequeueReusableCell(withReuseIdentifier: "tvShowCell", for: indexPath) as? TvShowsCell
        
        cell!.tvShowName.text = palabras[indexPath.row]
        
        return cell!
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension TvShowsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: tvShowCellWith, height: 350)
    }
}
