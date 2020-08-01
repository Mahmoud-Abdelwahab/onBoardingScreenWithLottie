//
//  OnBoardingViewController.swift
//  OnboardingScreenWithLottie
//
//  Created by kasper on 8/1/20.
//  Copyright © 2020 Mahmoud Abdul-Wahab. All rights reserved.
//

import UIKit

class OnBoardingViewController:  UIViewController {
  
    private let sildes = Slide.collection
    
    @IBOutlet var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      setUpCollectionView()
        
        // Do any additional setup after loading the view.
    }

    func setUpCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate   = self
        // to remove the top space above the collection view
        collectionView.contentInsetAdjustmentBehavior = .never
        
        // to make the collection paging work every one scroll = scroll one page
        collectionView.isPagingEnabled = true
    }

}

extension OnBoardingViewController : UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sildes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! OnBoardingCustomCell
//        var color = UIColor.clear
//        if indexPath.item % 2 == 0 {
//            color = UIColor.green
//        }else{
//            color = UIColor.blue
//        }
//        cell.backgroundColor = color
        
        cell.configureCell(slide : sildes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    // spacing between the cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
