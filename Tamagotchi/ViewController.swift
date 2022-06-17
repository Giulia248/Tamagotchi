//
//  ViewController.swift
//  Tamagotchi
//
//  Created by user on 17/06/22.
//

import UIKit
import Darwin
import AVFoundation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //use this to play the sound
        
            playSound(nameOfSound: "totapop")
        
        
        // Do any additional setup after loading the view.
    }
    
    //Funzione per musica suono
    var player : AVAudioPlayer!
    func playSound(nameOfSound : String) {
         
            guard let url = Bundle.main.url(forResource: nameOfSound, withExtension: "mp3") else {
         
                return
            }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                print("debug 3 ")
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                guard let player = player else { return }
                print("debug 4 ")
                
                player.play()
                player.numberOfLoops = 10
                
            } catch let error {
                print("Error was detected")
                print(error.localizedDescription)
            }
        }
   
    @IBAction func exitButton(_ sender: UIButton) {
        exit(0)
    }
    
    
    


}


