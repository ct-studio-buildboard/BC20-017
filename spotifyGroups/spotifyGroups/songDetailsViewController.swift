//
//  songDetailsViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/16/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class songDetailsViewController: UIViewController {
    @IBOutlet weak var scroll_view: UIScrollView!
    var gradientLayer = CAGradientLayer()
    @IBOutlet weak var bottom_bar: UIView!
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.3)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bottom_bar.bounds

        bottom_bar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
        scroll_view.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
        //close gesture
        let closeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeAction(tapGestureRecognizer:)))
        bottom_bar.isUserInteractionEnabled = true
        bottom_bar.addGestureRecognizer(closeGestureRecognizer)
        
    }
    

    @objc func closeAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
      })
    }

}
