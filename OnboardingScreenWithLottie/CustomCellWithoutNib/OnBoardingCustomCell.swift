//
//  OnBoardingCustomCell.swift
//  OnboardingScreenWithLottie
//
//  Created by kasper on 8/1/20.
//  Copyright © 2020 Mahmoud Abdul-Wahab. All rights reserved.
//

import UIKit

class OnBoardingCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var animationViewContainer : UIView!
    @IBOutlet weak var titlelable : UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBAction func actionBtnTapped(_ sender: Any) {
    }
    
    func configureCell(slide : Slide)  {
        titlelable.text = slide.title
        actionButton.backgroundColor = slide.ButtonColor
        actionButton.setTitle(slide.ButtonTitle, for: .normal)
    }
}
