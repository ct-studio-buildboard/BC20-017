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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_one.image == selectedImage {
            check_one.image = unselectedImage
        } else {
            check_one.image = selectedImage
        }
    }
    
    @objc func twoTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_two.image == selectedImage {
               check_two.image = unselectedImage
           } else {
                check_two.image = selectedImage
           }
       }
    @objc func threeTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_three.image == selectedImage {
               check_three.image = unselectedImage
           } else {
               check_three.image = selectedImage
           }
       }
    

}
