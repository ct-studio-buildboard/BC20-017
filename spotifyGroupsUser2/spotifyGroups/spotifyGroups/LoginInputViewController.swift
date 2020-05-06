//
//  LoginInputViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

var userName:String!

class LoginInputViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var loginButton: RoundButton!
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.isToolbarHidden = true
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        inputField.leftViewMode = UITextField.ViewMode.always
        inputField.leftView = spacerView
        inputField.layer.cornerRadius = 5
        inputField.layer.masksToBounds = true
        inputField.autocorrectionType = .no
        inputField.tintColor = .white
        inputField.delegate = self
        // Do any additional setup after loading the view.
        
        //Adding action to button
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        // Prepare URL
        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/login/")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        userName = inputField.text
        let postString = "userName=" + userName;
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        
        task.resume()
        
        // update userName to be used for later API calls
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        // Prepare URL
        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/login/")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        userName = inputField.text
        let postString = "userName=" + userName;
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        
        task.resume()
        
        //Need to load next page
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainpage") as! UIViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        return false
    }
    

   
}
