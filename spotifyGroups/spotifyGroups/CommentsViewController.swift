//
//  CommentsViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/22/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var back_button: UIView!
    @IBOutlet weak var comments_textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let placeholder = comments_textfield.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        comments_textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:8, height:8))
        comments_textfield.leftViewMode = UITextField.ViewMode.always
        comments_textfield.leftView = spacerView
        comments_textfield.layer.cornerRadius = 17
        comments_textfield.layer.masksToBounds = true
        comments_textfield.autocorrectionType = .no
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backTapped(tapGestureRecognizer:)))
        back_button.isUserInteractionEnabled = true
        back_button.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func backTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
          self.dismiss(animated: true, completion: {
                  self.presentingViewController?.dismiss(animated: true, completion: nil)
            })
    }


}
