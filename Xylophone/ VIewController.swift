//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    var audioPlayer : AVAudioPlayer!
    var selectedFileName : String = ""
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        //the sender parameter is attached by default to each button clicked
        //so the .tag property comes with the button by default.. each button has a tag property by default attached to them
//        sender.tag-1 implies starting from the 0 index of the sound array i.e : 1-1 basically because array start from 0 index
        selectedFileName = soundArray[sender.tag - 1]
        print(selectedFileName)
        playSound()
    }
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource : selectedFileName, withExtension: "wav")
        
        do{
            //setting the audio player to contain the URL of what it should play
            //use the try keyword here because the AVAudioPlayer source code is attached with the throw keyword which needs the try keyword to make use of it effectively
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }
  

}

