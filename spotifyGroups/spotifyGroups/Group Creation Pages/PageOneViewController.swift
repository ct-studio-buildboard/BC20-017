//
//  PageOneViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var button: UIButton!
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
        
        //Adding action to button
        button.addTarget(self, action: #selector(updateImage), for: .touchUpInside)
    }
    
    @IBAction func updateImage(sender: UIButton) {
        self.groupImage.image = UIImage(named: "new_222")
        self.groupImage.layer.cornerRadius = 4
        self.groupImage.layer.masksToBounds = true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Group Name" {
            groupName.text = String()
            groupName.textColor = UIColor.white
        }
        else if textView.text == "Group Description" {
            groupDesc.text = String()
            groupDesc.textColor = UIColor.white
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
