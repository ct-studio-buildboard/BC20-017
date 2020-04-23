//
//  InviteViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/20/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {
    
    @IBOutlet weak var dismiss_view: UIView!
    @IBOutlet weak var join_button: RoundButton!
    @IBOutlet weak var invite_viewcontainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //rounded corners
        invite_viewcontainer.layer.cornerRadius = 8
        invite_viewcontainer.layer.masksToBounds = true
        
        //join button action
        join_button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //dismiss gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(controlTapped(tapGestureRecognizer:)))
        dismiss_view.isUserInteractionEnabled = true
        dismiss_view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func buttonAction(sender: UIButton!) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "mainpage") as! UIViewController
//        //vc.selectedIndex = 2
//        vc.providesPresentationContextTransitionStyle = true
//        vc.definesPresentationContext = true
//        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
//        present(vc, animated: true, completion: nil)
        self.dismiss(animated: true, completion: {
              self.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
    
    @objc func controlTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.dismiss(animated: true, completion: {
             self.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }

}
