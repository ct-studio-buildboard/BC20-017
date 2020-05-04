//
//  PageOneSubViewController.swift
//  spotifyGroups
//
//  Created by Jae Min Cha on 04/05/2020.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageOneSubViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UITextView!
    @IBOutlet weak var groupDesc: UITextView!
    
    @IBOutlet weak var main_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        groupName.delegate = self
        groupDesc.delegate = self
        groupName.textContainer.maximumNumberOfLines = 1
        groupName.textContainer.lineBreakMode = .byTruncatingTail
        groupDesc.textContainer.maximumNumberOfLines = 1
        groupDesc.textContainer.lineBreakMode = .byTruncatingTail
        
        // Do any additional setup after loading the view.
        let name = userName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // For placeholder text in Group Name and Group Description
        groupName.text = "Group Name"
        groupName.textColor = UIColor.lightGray
        
        groupDesc.text = "Group Description"
        groupDesc.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Group Name" {
            groupName.text = String()
        }
        else if textView.text == "Group Description" {
            groupDesc.text = String()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
