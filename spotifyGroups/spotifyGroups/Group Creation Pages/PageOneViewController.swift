//
//  PageOneViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var groupName: UITextView!
    @IBOutlet weak var groupDesc: UITextView!
    
    @IBOutlet weak var main_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        
        // For placeholder text in Group Name and Group Description
        groupName.delegate = self
        groupName.text = "Group Name"
        groupName.textColor = UIColor.lightGray
        
        groupDesc.delegate = self
        groupDesc.text = "Group Description"
        groupDesc.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.white
        }
    }
}
