//
//  LoginViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/19/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

extension UIButton{
    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
extension UILabel{
    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.text!))
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.text!.count)))
        self.attributedText = attributedString
    }
}

class LoginViewController: UIViewController {
    @IBOutlet var loginView: UIView!
    @IBOutlet weak var spotifyIcon: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.isToolbarHidden = true
        
        let viewHeight = self.loginView.frame.size.height
        let viewWidth = self.loginView.frame.size.width
        spotifyIcon.translatesAutoresizingMaskIntoConstraints = false
        
        //icon
        let iconSize = viewWidth/7
        spotifyIcon.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        spotifyIcon.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        spotifyIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.15*viewHeight).isActive = true
        
        //static words
        loginLabel.addTextSpacing(-1)
        
        //login button
        loginButton.addTextSpacing(1.0)
        
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
