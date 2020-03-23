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
    
    let musicDict: [String:String] = ["ff7":"ff7BattleTheme","keys":"door_keys","corona":"Jealous_Coronavirus", "chocobo":"ff15Chocobo", "sephiroth":"SephirothTheme","feather":"Pillow","steel":"Steel"]
    
    
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
    
    func playOnce(sound:String){
        let music = NSURL(fileURLWithPath: Bundle.main.path(forResource: musicDict[sound], ofType: "mp3")!)
        do {
            audioPlayer = try! AVAudioPlayer(contentsOf: music as URL)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = 1
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    //Mark: use deinit{NotificationCenter.default.removeObserver(self)} to clean out old observers (Clear/clean)
    //MARK: Example
    // SoundManager.shared.audioPlayerObserver() this goes into viewdidLoad to create observer
    //MARK: Using soundmanager in seperate function
    // can be objc function if you want it to be used for a button or a normal function if you want to call it somewhere else 
    // @objc func secondaryPause(){
//        SoundManager.shared.postAudioplayer()
//    }
    
    
    /// This function makes an observer that constantly checks for a didupdateaudioplayer post and when it does see it pause function runs
    func audioPlayerPuaseObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(pause), name: .didPauseAudioPlayer, object: nil)
    }
    
    /// This function makes an observer that constantly checks for a didupdateaudioplayer post and when it does see it stops the music/song
    func audioPlayerStopObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(stopPlaying), name: .didStopAudioPlayer, object: nil)
    }
    
    
    /// This function makes a post letting notification know so it will run the observer you made in vc
    @objc func postAudioplayer(){
        let name = Notification.Name("didPauseAudioPlayer")
        NotificationCenter.default.post(name: name, object: nil)
    }
    
    @objc func pause(){
        if audioPlayer!.isPlaying{
            audioPlayer?.pause()
        }
        else {
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }

    
    @objc func stopPlaying(){
        if audioPlayer!.isPlaying{
            audioPlayer?.stop()
        }
        else {
        }
    }
    
}

//Making unique ID/name
extension Notification.Name {
    static let didPauseAudioPlayer = Notification.Name("didPauseAudioPlayer")
    static let didStopAudioPlayer = Notification.Name("didStopAudioPlayer")
}
