//
//  ViewController.swift
//  EGG TImer
//
//  Created by PhyoWai Aung on 9/26/23.
//

import UIKit
import AVFoundation
import Dispatch

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var secondPassed = 0
    var timer = Timer()
    var totalTime = 0
    
    @IBOutlet var eggLabel: UILabel!
    
    
    @IBOutlet var eggProgress: UIProgressView!
    
    
    
    
    let hardness = ["Soft" : 3,"Medium" : 240,"Hard" : 420]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        
        let hardNess = sender.currentTitle!
            totalTime = hardness[hardNess]!
        eggProgress.progress = 0.0
            secondPassed = 0
            eggLabel.text = hardNess
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            eggProgress.progress = Float(secondPassed) / Float(totalTime)
        }else
        {
            timer.invalidate()
            eggLabel.text = "Done"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarmsound", withExtension: "wav")
        player = try! AVAudioPlayer (contentsOf: url!)
        player.play()
    }
}
