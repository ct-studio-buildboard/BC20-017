//
//  OptionalCommentViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/22/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class OptionalCommentViewController: UIViewController {

    @IBOutlet weak var comment_field: UITextField!
    @IBOutlet weak var selected_song1: UIImageView!
    @IBOutlet weak var song1: UIView!
    @IBOutlet weak var main_view: UIView!
    var gradientLayer = CAGradientLayer()
    let selectedImage = UIImage(named: "selected_circle")!
    let unselectedImage = UIImage(named: "unselected_circle")!
    var button = RoundButton(frame: CGRect(x: 97, y: 630, width: 180, height: 46))
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.3)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.7)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = main_view.bounds

        main_view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        comment_field.leftViewMode = UITextField.ViewMode.always
        comment_field.leftView = spacerView
        comment_field.layer.cornerRadius = 20
        comment_field.layer.masksToBounds = true
        comment_field.autocorrectionType = .no
        comment_field.tintColor = .white

        // Do any additional setup after loading the view.
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        
        song1.layer.cornerRadius = 8;
        song1.layer.masksToBounds = true;
        
//        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
//        song1.isUserInteractionEnabled = true
//        song1.addGestureRecognizer(tapGestureRecognizerOne)
        
         //Creating the Finish Button
        button.cornerRadius = 20
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("SHARE", for: .normal)
        button.titleLabel?.font =  UIFont(name: "CircularStd-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
        main_view.addSubview(button)
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if selected_song1.image == selectedImage {
            selected_song1.image = unselectedImage
            gradientLayer.removeFromSuperlayer()
            button.removeFromSuperview()
        } else {
            selected_song1.image = selectedImage
            setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
            main_view.addSubview(button)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
           self.dismiss(animated: true, completion: {
               self.presentingViewController?.dismiss(animated: true, completion: nil)
         })
       }


}
