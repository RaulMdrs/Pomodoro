//
//  ViewController.swift
//  Pomodoro
//
//  Created by Raul de Medeiros on 31/10/22.
//

import UIKit

enum TypePomodoro{
    case pomodoro, short, long
}

class ViewController: UIViewController {

    @IBOutlet weak var typePomodoro: UISegmentedControl!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var buttonControl: UIButton!
    
    var typeOfPomodoro : TypePomodoro = .pomodoro
    var timer = Timer()
    var time : (minutes : Int, seconds : Int) = (00, 00)
    var timeString : String = ""
    var timerIsEnable = false
    //var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redefine()
    }

    func convertTimeToLabel(minute : Int, seconds : Int){
        timeString = ""
        if time.minutes < 10{
            timeString.append("0\(time.minutes):")
        }else{
            timeString.append("\(time.minutes):")
        }
        
        if time.seconds <= 0{
            time.seconds = 59
            time.minutes -= 1
        }
        
        if time.seconds < 10{
            timeString.append("0\(time.seconds)")
        }
        else{
            timeString.append("\(time.seconds)")
        }
        
        
        if time.minutes == 0 && time.minutes == 0 {
            timer.invalidate()
            redefine()
            timeString = "00:00"
            updateButtonTitle(title: "Start again")
        }
        
        timerLabel.text = timeString
        time.seconds -= 1
    }
    
    func redefine()
    {
        timerIsEnable = false
        timer.invalidate()
        switch typePomodoro.selectedSegmentIndex {
        case 0: typeOfPomodoro = .pomodoro
            timerLabel.text = "25:00"
            time = (24, 59)
        case 1: typeOfPomodoro = .short
            timerLabel.text = "5:00"
            time = (4, 59)
        case 2: typeOfPomodoro = .long
            timerLabel.text = "15:00"
            time = (14, 59)
        default: typeOfPomodoro = .pomodoro
            timerLabel.text = "25:00"
        }
        updateButtonTitle(title: "Start")
    }
    
    func updateButtonTitle(title : String){
        buttonControl.setTitle(title, for: .normal)
    }
    
    @IBAction func buttonControlPressed(_ sender: UIButton) {
        if !timerIsEnable{
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    print("\(self.time.minutes):\(self.time.seconds)")
                self.convertTimeToLabel(minute: self.time.minutes, seconds: self.time.seconds)
            }
            timerIsEnable = true
            updateButtonTitle(title: "Stop")
        }else{
            timer.invalidate()
            updateButtonTitle(title: "Return")
            timerIsEnable = false
        }
    }
    
    
    @IBAction func chooseType(_ sender: UISegmentedControl) {
            redefine()
    }
    
}
