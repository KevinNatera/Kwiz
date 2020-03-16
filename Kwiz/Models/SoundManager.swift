//
//  SoundManager.swift
//  Kwiz
//
//  Created by EricM on 3/16/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    
    static let shared = SoundManager()
    
    var audioPlayer: AVAudioPlayer?
    
    let musicDict: [String:String] = ["ff7":"ff7BattleTheme","keys":"door_keys","corona":"Jealous_Coronavirus", "chocobo":"ff15Chocobo", "sephiroth":"SephirothTheme"]
    
    
    /// function that chooses the music to be played
    /// - Parameter sound: name of key in dictionary that has filename as value
    func chooseSound(sound:String){
        let music = NSURL(fileURLWithPath: Bundle.main.path(forResource: musicDict[sound], ofType: "mp3")!)
        do {
            audioPlayer = try! AVAudioPlayer(contentsOf: music as URL)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    func stopPlaying(){
        if audioPlayer!.isPlaying{
            audioPlayer?.stop()
        }
        else {
        }
    }
    
    func playInAllVC(){
        
    }
}
