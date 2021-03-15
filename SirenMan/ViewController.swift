//
//  ViewController.swift
//  SirenMan
//
//  Created by Pierce Goulimis on 2021-03-15.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Properties
    var player: AVAudioPlayer?
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var holdToTalkBtn: UIButton!
    @IBOutlet weak var rumblerBtn: UIButton!
    @IBOutlet weak var hornBtn: UIButton!
    @IBOutlet weak var wailBtn: UIButton!
    @IBOutlet weak var moveItFolksBtn: UIButton!
    
    var isMicOn = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeButton(button: button1, radius: 10)
        changeButton(button: button2, radius: 10)
        changeButton(button: rumblerBtn, radius: 10)
        changeButton(button: holdToTalkBtn, radius: 10)
        changeButton(button: hornBtn, radius: 10)
        changeButton(button: wailBtn, radius: 10)
        changeButton(button: moveItFolksBtn, radius: 10)

    }
    
    
    //MARK: - Handlers
    
    
    //MARK: - Actions
    
    @IBAction func wailBtnPressed(_ sender: Any) {
        playSound(fileName: "SIREN_PA20A_WAIL", infiniteLoop: true)
    }
    
    
    @IBAction func moveItFolksBtnPressed(_ sender: Any) {
        playSound(fileName: "LCPDFR_MOVEITFOLKS_1", infiniteLoop: false)
    }
    
    
    @IBAction func holdToTalkBtnPressed(_ sender: Any) {
        
        if isMicOn == true {
            //tapped to turn it off
            
            
            
            //change text to MIC ON
            holdToTalkBtn.setTitle("MIC OFF", for: .normal)
            
            //set isMicOn to false
            isMicOn = false
            
        } else if isMicOn == false {
            
            //tapped to turn it on
            
            
            
            
            //change text to MIC ON
            holdToTalkBtn.setTitle("MIC ON", for: .normal)
            
            //set isMicOn to false
            isMicOn = true
            
        }
        
        
    }
    
    
    @IBAction func hornbtnPressed(_ sender: Any) {
        playSound(fileName: "AIRHORN_EQD", infiniteLoop: false)
    }
    

    @IBAction func primaryBtnPressed(_ sender: Any) {
        
        playSound(fileName: "PRIMARY_1", infiniteLoop: true)
        
    }
    
    
    @IBAction func rumblerBtnPressed(_ sender: Any) {
        playSound(fileName: "RUMBLER_1", infiniteLoop: true)
    }
    
    
    @IBAction func policeRadioPressed(_ sender: Any) {
        playSound(fileName: "Police Radio Chatter - Sound Effect for Editing", infiniteLoop: false)
    }
    
    func changeButton(button: UIButton!, radius:CGFloat!) -> Void {
        
        button.layer.cornerRadius = radius
        button.clipsToBounds = true
    }
    
    func playSound(fileName: String!, infiniteLoop: Bool!) -> Void {
        if let player = player, player.isPlaying {
            
            player.stop()
            
        } else {
            
            let urlString = Bundle.main.path(forResource: fileName, ofType: "wav")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else { return }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else { return }
                
                player.play()
                if infiniteLoop == true {
                    player.numberOfLoops = .max
                } else {
                    player.numberOfLoops = 1
                }
                
                
            } catch {
                
            }
        }
    }
    
}

