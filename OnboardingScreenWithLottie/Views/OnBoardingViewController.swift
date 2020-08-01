//
//  OnBoardingViewController.swift
//  OnboardingScreenWithLottie
//
//  Created by kasper on 8/1/20.
//  Copyright © 2020 Mahmoud Abdul-Wahab. All rights reserved.
//

import UIKit

class OnBoardingViewController:  UIViewController {
    
    private let slides = Slide.collection
    @IBOutlet weak var pageController : UIPageControl!
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        configurepageConrtoller()
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
    
    
    private func handelActionBtnTape(at indexpath : IndexPath) {
        if indexpath.item == slides.count-1{
            // got to the home Screen
            ShowMainScreen()
            
        }else{
            let nextItem = indexpath.item + 1
            let nextItemIndexPath = IndexPath(item: nextItem, section: 0)
            collectionView.scrollToItem(at: nextItemIndexPath, at: .top, animated: true)
            pageController.currentPage = nextItem
        }
        
    }
    
    
    private func configurepageConrtoller(){
        pageController.numberOfPages = slides.count
        // let angle = CGFloat.pi/2
        // pageController.transform = CGAffineTransform(rotationAngle: angle)
        
    }
    
    
    private func ShowMainScreen(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainVCStoryBoard")
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene ,
            let scenDelegate = windowScene.delegate as? SceneDelegate,
            let window = scenDelegate.window {
            window.rootViewController = mainVC
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
    
}

extension OnBoardingViewController : UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
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
        cell.didTapActionBtn = { [weak self] in
            guard let self = self else {
                return
            }
            self.handelActionBtnTape(at: indexPath)
        }
        
        cell.configureCell(slide : slides[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    // spacing between the cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    // to Detect the cell index which i show now
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //
        let currentIndex = Int ((collectionView.contentOffset.y) / (scrollView.frame.size.height))
        print(currentIndex)
        //collectionView.contentOffset.y this ==  cell height == scrollView.frame.size.height  so if i scrolled to the second cell then the collectionView.contentOffset.y == 2*cell height
        /// now i will set the page indecator with the current index
        
        pageController.currentPage = currentIndex
    }
}
