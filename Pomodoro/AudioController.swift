//
//  AudioController.swift
//  Pomodoro
//
//  Created by Raul de Medeiros on 01/11/22.
//

import Foundation
import AVFoundation

class AudioController{
    static var player : AVAudioPlayer?
    static var nameSound : String = "alarm_1"
    static var volume : Float = 1.0
    
    static func PlaySound(name : String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            print("retornei \(name)")
            return}
        
             do {
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: "wav")
                 player?.play()
             } catch let error as NSError {
                 print("Deu ruim aqui: \(error.localizedDescription)")
             }
    }
    
    static func PlaySound(){
        guard let url = Bundle.main.url(forResource: nameSound, withExtension: "wav") else{
            return}
             do {
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: "wav")
                 player?.volume = volume
                 player?.play()
             } catch let error as NSError {
                 print("Deu ruim aqui: \(error.localizedDescription)")
             }
    }
}
