//
//  Slide.swift
//  OnboardingScreenWithLottie
//
//  Created by kasper on 8/1/20.
//  Copyright © 2020 Mahmoud Abdul-Wahab. All rights reserved.
//

import UIKit
struct Slide {
    let title : String
    let animationName : String
    let ButtonTitle   : String
    let ButtonColor   : UIColor
    
    static let collection:[Slide] = [
        .init(title : "Get Your Favorite Food Delivered to you under 30 minutes anytime", animationName: "", ButtonTitle: "Next", ButtonColor: UIColor.systemYellow),
        .init(title : "We Serve Only From Choiced restaurants in your area", animationName: "", ButtonTitle: "Order Now", ButtonColor: UIColor.systemGreen)
    ]
}
