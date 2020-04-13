//
//  musicViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit
import AVFoundation
var audioPlayer:AVAudioPlayer!

class musicViewController: UIViewController {

    @IBOutlet weak var playImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        playImage.isUserInteractionEnabled = true
        playImage.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "music/Bob_Marley_-_Is_This_Love", withExtension: "mp3")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            
            player.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        if  audioPlayer.isPlaying{
            audioPlayer.pause()
        }else{
         audioPlayer.play()
         }
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
