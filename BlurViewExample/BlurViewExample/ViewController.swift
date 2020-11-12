//
//  ViewController.swift
//  BlurViewExample
//
//  Created by Sahil Arora on 2020-11-11.
//  Copyright © 2020 Sahil Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var   visualEffectView:UIVisualEffectView = UIVisualEffectView()
    
    // MAking custom imageview
    private var backgroundImageView:UIImageView = {
        
       let imgView = UIImageView(image: UIImage(named: "Scenary"))
        imgView.contentMode = .scaleAspectFill

        return imgView
        
    }()
    //Making a Custom button
    private var button_Ok:UIButton = {
        let btn  = UIButton()
        btn.setTitle("Click Me", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.borderWidth = 1.0
        btn.addTarget(self, action: #selector(removeBlurView), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame  = view.bounds
        animateBlurView()
        
    }
    
    func animateBlurView(){
        let blurEffect =  UIBlurEffect(style: .regular)
         visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        visualEffectView.alpha = 0
        view.addSubview(visualEffectView)
        
        button_Ok.frame = CGRect(x: (self.view.frame.size.width-150)/2, y: (self.view.frame.size.height-60)/2, width: 150, height: 60)
        visualEffectView.contentView.addSubview(button_Ok)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.visualEffectView.alpha = 1
            }, completion: nil)
        })
    }
    @objc func removeBlurView(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                self.visualEffectView.alpha = 0
            }, completion: nil)
        }
    }
}

