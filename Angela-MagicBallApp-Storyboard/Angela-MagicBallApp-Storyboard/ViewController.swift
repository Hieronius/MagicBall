//
//  ViewController.swift
//  Angela-MagicBallApp-Storyboard
//
//  Created by Арсентий Халимовский on 17.01.2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballAnswer: UIImageView!
    
    // added entity for audio player
    var player: AVAudioPlayer?
    
    let arrayOfTheAnswers =
        [
        UIImage(named: "ball1"),
        UIImage(named: "ball2"),
        UIImage(named: "ball3"),
        UIImage(named: "ball4"),
        UIImage(named: "ball5")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func askQuestion(_ sender: UIButton) {
        
        playSound()
        
        // 1. We use DispatchQueue.main as main thread
        // 2. Now we set deadline as now plus a one and half of the second
        // 3. Execute mean the real action or method to run after this moment
        // This is the same thread where the whole app running
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: changeBallAnswer)
        
    }
    
    // made separate function for answers of the ball
    func changeBallAnswer() {
        ballAnswer.image = arrayOfTheAnswers.randomElement()!
    }
    
    // separate function for playing the specific sound after button was pressed.
    func playSound() {
        
        // 1. let's check the content of our app. Is it has needed file or not:
        guard let path = Bundle.main.path(forResource: "sound", ofType: "mp3") else { return }
        
        // 2. Use our sound file to make a specific url for our audio player:
        let url = URL(fileURLWithPath: path)
        
        // 3. Special do-catch block to try if there is a real sound and it's working correctly
        do {
            // 3.1 Load our sound to AudioPlayer
            player = try AVAudioPlayer(contentsOf: url)
            // 3.2 Play the sound
            player?.play()
            
            // 3.3 If it's not let's throw the error and print it's description
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

