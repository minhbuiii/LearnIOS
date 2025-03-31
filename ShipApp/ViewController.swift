//
//  ViewController.swift
//  ShipApp
//
//  Created by Bùi Minh on 31/3/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ship: UIImageView!
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "spaceshipfly", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func onButtonClicked(_ sender: Any) {
        self.audioPlayer.play()
        self.ship.isHidden = false
        UIView.animate(withDuration: 3, animations: {
            self.ship.frame = CGRect(x: 50, y: 300, width: 300, height: 200 )
        })
    }
    
}

