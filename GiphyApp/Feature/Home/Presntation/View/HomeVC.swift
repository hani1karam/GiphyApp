//
//  HomeVC.swift
//  GiphyApp
//
//  Created by hany karam on 2/19/22.
//

import UIKit
import RxSwift
import RxCocoa
class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var homeCV: UICollectionView!
    static let cellIdentifierDemoCell = "HomeCollectionViewCell"
    public var branchesViewModel:GiphyViewModel?
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    var leftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settupNav()
        showCatrogy()
        subscribeToResponse()
        self.homeCV.delegate = self
    }
    
    func settupNav(){
        navigationController?.navigationBar.barTintColor = UIColor(named: "color_bar")
        let imageView = UIImageView(image: UIImage(named: "GiphyLogoEmblem"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 30))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        self.navigationItem.titleView = titleView
    }
    
    func showCatrogy(){
        homeCV.register(UINib(nibName: HomeVC.cellIdentifierDemoCell, bundle: nil), forCellWithReuseIdentifier: HomeVC.cellIdentifierDemoCell)
    }
    
    func subscribeToResponse() {
        self.branchesViewModel?.featchGiphy().subscribe(onNext:{[weak self] dataItem in
            Observable.of(dataItem.data ?? []).bind(to: (self?.homeCV.rx
                                                            .items(cellIdentifier: "HomeCollectionViewCell",
                                                                   cellType: HomeCollectionViewCell.self))!) {[weak self] row, branch, cell in
                cell.name.text = branch.title
                cell.reloadImage(image:branch)
                
            }.disposed(by: self?.disposeBag ?? DisposeBag())
        })
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width * 0.5) - 10 , height: 259)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
