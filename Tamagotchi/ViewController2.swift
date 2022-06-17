//
//  ViewController2.swift
//  Tamagotchi
//
//  Created by user on 17/06/22.
//

import UIKit


class ViewController2: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hidden items
        petImage.isHidden = true
        infoButtonOutlet.isHidden = true
        musicButtonOutlet.isHidden = true
        foodButtonOutlet.isHidden = true
        foodOutlet.isHidden = true
        heartImage2.isHidden = true
        
    }
    

    //elementi 
    @IBOutlet var petImage: UIImageView!
    @IBOutlet var heartButtonOutlet: UIButton!
    
    @IBOutlet var heartImage: UIImageView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var infoButtonOutlet: UIButton!
    @IBOutlet var foodButtonOutlet: UIButton!
    @IBOutlet var musicButtonOutlet: UIButton!
    @IBOutlet var foodOutlet: UIImageView!
    @IBOutlet var heartImage2: UIImageView!
    var happy: Int = 1 //val da 1 a 10
    
    @IBAction func infoButton(_ sender: UIButton) {
        label1.text = "ciao sono Jimmy e il mio livello di felicità é \(happy)"
    }
    
    
    
    
    
    //timer1 cuore
     var timer1 : Timer!
     var ck = 0
     var ck2 = true
    @objc func timerMethod1(){
       if ck <= 100{
          ck += 1
           if ck2 {
               heartImage.isHidden = true
               heartImage2.isHidden = false
               ck2 = false
           }else{
               heartImage.isHidden = false
               heartImage2.isHidden = true
               
               ck2 = true
           }
           
           
       }else if ck == 101{
              //instructions
              timer1.invalidate()
            }
        }
    
    //timer per la fame
    //timer2 metod
     var timer2 : Timer!
     var ck3 = true
    var hungry = true
    @objc func timerMethodHungry(){
       if ck3 {
           ck3 = false
          //instruction
       }else if ck3 == false{
              //instructions
           hungry = true
              timer1.invalidate()
            }
        }
    //timer per far sparire il cibo
    //timer3 metod
     var timer3 : Timer!
     var ck4 = 0
    @objc func timerMethodFood(){
       if ck4 <= 3 {
           ck4 += 1
          //instruction
       }else if ck4 == 4{
              //instructions
           foodOutlet.isHidden = true
              timer1.invalidate()
            }
        }
    
    
    
    
    
    
        
    @IBAction func foodButton(_ sender: UIButton) {
        
        if hungry{
            label1.text = "gnam!"
            var foodimg = " "
            let r = Int.random(in: 1...3)
            switch r {
            case 1:
                foodimg = "food1"
            case 2:
                foodimg = "food2"
            case 3:
                foodimg = "food3"
            default:
                print("no")
            }
            
            foodOutlet.image = UIImage(named: foodimg)
            foodOutlet.isHidden = false
            happy += 1
            print(happy)
            //how to create the timer and start it
            timer2 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerMethodHungry), userInfo: nil, repeats: true)
            hungry = false
            timer3 = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(timerMethodFood), userInfo: nil, repeats: true)
            
            timer3 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerMethodFood), userInfo: nil, repeats: true)
            
        }else{
            label1.text = "non ho fame!"
        }
  
        
    }
    
    @IBAction func heartButton(_ sender: Any) {
        heartButtonOutlet.isHidden = true
        petImage.isHidden = false
        petImage.image = UIImage(named: "dino")
        timer1 = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(timerMethod1), userInfo: nil, repeats: true)
      
        
        foodButtonOutlet.isHidden = false
        musicButtonOutlet.isHidden = false
        infoButtonOutlet.isHidden = false
    }
    
    
    
    

        
        


        
        
        
    
    
    
    

    

}
