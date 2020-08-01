//
//  OnBoardingCustomCell.swift
//  OnboardingScreenWithLottie
//
//  Created by kasper on 8/1/20.
//  Copyright © 2020 Mahmoud Abdul-Wahab. All rights reserved.
//

import UIKit
import Lottie

class OnBoardingCustomCell: UICollectionViewCell {
    
    
    var didTapActionBtn : (()-> Void)?
    
    @IBOutlet weak var animationViewContainer: AnimationView!
    
    @IBOutlet weak var titlelable : UILabel!
    
    
    @IBOutlet weak var actionButton: UIButton!
    @IBAction func actionBtnTapped(_ sender: Any) {
        didTapActionBtn?()
    }
    
    func configureCell(slide : Slide)  {
        titlelable.text = slide.title
        actionButton.backgroundColor = slide.ButtonColor
        actionButton.setTitle(slide.ButtonTitle, for: .normal)
        
        let animation = Animation.named(slide.animationName)
        animationViewContainer.animation = animation
        animationViewContainer.loopMode = .loop
        
        if !animationViewContainer.isAnimationPlaying{
            animationViewContainer.play()
        }
    }
}
