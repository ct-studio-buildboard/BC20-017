//
//  LoginInputViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class LoginInputViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.isToolbarHidden = true
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        inputField.leftViewMode = UITextField.ViewMode.always
        inputField.leftView = spacerView
        inputField.layer.cornerRadius = 5
        inputField.autocorrectionType = .no
        inputField.tintColor = .white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
