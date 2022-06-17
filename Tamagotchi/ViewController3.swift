//
//  ViewController3.swift
//  Tamagotchi
//
//  Created by user on 17/06/22.
//

import UIKit
import AVFoundation

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //funzione di suono
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
           } catch let error {
               print("Error was detected")
               print(error.localizedDescription)
           }
   }
       
    @IBAction func saxophoneButton(_ sender: UIButton) {
        
        playSound(nameOfSound: "saxophone")
         
    }
    
    @IBAction func violinButton(_ sender: UIButton) {
        playSound(nameOfSound: "violin")
    }
    
    @IBAction func guitarButton(_ sender: UIButton) {
        playSound(nameOfSound: "guitar")
    }
    
   
    @IBAction func pigButton(_ sender: UIButton) {
        playSound(nameOfSound: "pig")
    }
    
    
    
    
    
    
    
    
}
