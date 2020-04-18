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

class musicViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var main_view: UIView!
    @IBOutlet weak var progress_bar: UIProgressView!
    @IBOutlet weak var playImage: UIImageView!
    
    let playImg = UIImage(systemName: "play.fill")!
    let pauseImg = UIImage(systemName: "pause.fill")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pause, play gestures
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        playImage.isUserInteractionEnabled = true
        playImage.addGestureRecognizer(tapGestureRecognizer)
        
        //Go to playview gesture
        let songGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(songTapped(tapGestureRecognizer:)))
        main_view.isUserInteractionEnabled = true
        main_view.addGestureRecognizer(songGestureRecognizer)
        
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "music/Bob_Marley_-_Is_This_Love", withExtension: "mp3")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progress_bar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            
            player.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func updateAudioProgressView() {
        if audioPlayer.isPlaying {
            //Update Progress
            progress_bar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if  audioPlayer.isPlaying{
            audioPlayer.pause()
            playImage.image = playImg
        }else{
         audioPlayer.play()
            playImage.image = pauseImg
         }
    }
    
    @objc func songTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "playView")) as! playViewController as playViewController
        vc.modalPresentationStyle = .popover

        if let presentationController = vc.popoverPresentationController {
            presentationController.delegate = self
            presentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            presentationController.sourceView = self.view
            presentationController.sourceRect = CGRect(x:self.view.bounds.midX, y: self.view.bounds.midY,width: 315,height: 230)

            self.present(vc, animated: true, completion: nil)
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
