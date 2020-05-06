//
//  ChooseGroupsViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/22/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class ChooseGroupsViewController: UIViewController {

    @IBOutlet weak var check_one: UIImageView!
    @IBOutlet weak var check_two: UIImageView!
    @IBOutlet weak var check_three: UIImageView!
    @IBOutlet weak var group1: UIView!
    @IBOutlet weak var group2: UIView!
    @IBOutlet weak var group3: UIView!
    @IBOutlet weak var main_view: UIView!
    let selectedImage = UIImage(named: "selected_circle")!
    let unselectedImage = UIImage(named: "unselected_circle")!
    
    var numSelected: Int!
    
    var gradientLayer = CAGradientLayer()
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
        numSelected = 0
        // Do any additional setup after loading the view.
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        
        group1.layer.cornerRadius = 8;
        group1.layer.masksToBounds = true;
        group2.layer.cornerRadius = 8;
        group2.layer.masksToBounds = true;
        group3.layer.cornerRadius = 8;
        group3.layer.masksToBounds = true;
        
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
        group1.isUserInteractionEnabled = true
        group1.addGestureRecognizer(tapGestureRecognizerOne)
        
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(twoTapped(tapGestureRecognizer:)))
        group2.isUserInteractionEnabled = true
        group2.addGestureRecognizer(tapGestureRecognizerTwo)
        
        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(threeTapped(tapGestureRecognizer:)))
        group3.isUserInteractionEnabled = true
        group3.addGestureRecognizer(tapGestureRecognizerThree)
        
        //Creating the Finish Button
        //        button = RoundButton(frame: CGRect(x: 97, y: 630, width: 180, height: 46))
        button.cornerRadius = 23
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font =  UIFont(name: "CircularStd-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_one.image == selectedImage {
            check_one.image = unselectedImage
            numSelected -= 1
            if numSelected == 0 {
                gradientLayer.removeFromSuperlayer()
                button.removeFromSuperview()
            }
        } else {
            check_one.image = selectedImage
            numSelected += 1
            if numSelected == 1 {
                setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                main_view.addSubview(button)
            }
        }
    }
    
    @objc func twoTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_two.image == selectedImage {
               check_two.image = unselectedImage
                numSelected -= 1
                if numSelected == 0 {
                    gradientLayer.removeFromSuperlayer()
                    button.removeFromSuperview()
                }
           } else {
                check_two.image = selectedImage
                numSelected += 1
                if numSelected == 1 {
                    setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                    main_view.addSubview(button)
                }
           }
       }
    
    @objc func threeTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_three.image == selectedImage {
            check_three.image = unselectedImage
            numSelected -= 1
            if numSelected == 0 {
                gradientLayer.removeFromSuperlayer()
                button.removeFromSuperview()
            }
        } else {
            check_three.image = selectedImage
            numSelected += 1
            if numSelected == 1 {
                setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                main_view.addSubview(button)
            }
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        //Nothing
        return
    }

    

}
