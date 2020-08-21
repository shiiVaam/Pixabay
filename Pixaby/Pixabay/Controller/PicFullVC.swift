//
//  PicFullVC.swift
//  Pixabay
//
//  Created by Shivam Sharma on 20/08/20.
//  Copyright © 2020 Shivam Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class PicFullVC: UIViewController {

    @IBOutlet weak var colViewFullPic: UICollectionView!{
        didSet{
            colViewFullPic.register(UINib(nibName: "ImageCVC", bundle: nil), forCellWithReuseIdentifier: "ImageCVC")
                       colViewFullPic.dataSource = self
                       colViewFullPic.delegate = self
            
        }
    }
    
    var model:[Hits]?
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let indexPath = IndexPath(item: index, section: 0)

        colViewFullPic.scrollToItem(at: indexPath, at: .right, animated: true)
        colViewFullPic.reloadData()
    }
    
//    MARK:- Action
    
    @IBAction func onClickBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
//    MARK:- CollectionView Delegate and Datasource

extension PicFullVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCVC", for: indexPath) as! ImageCVC
        
        cell.imgViewPicture.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imgViewPicture.sd_imageIndicator?.startAnimatingIndicator()
        cell.imgViewPicture.sd_setImage(with: URL(string: self.model?[indexPath.item].largeImageURL ?? ""), completed: nil)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width:collectionView.frame.size.width ,height:collectionView.frame.size.height)
    }
    
}
