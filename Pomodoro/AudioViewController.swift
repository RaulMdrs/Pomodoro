//
//  AudioViewController.swift
//  Pomodoro
//
//  Created by Raul de Medeiros on 01/11/22.
//

import UIKit

class AudioViewController: UIViewController {

    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    public var soundString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cheguei")
        updateUI()
    }
    
    @IBAction func chooseSound(_ sender: UISegmentedControl) {
        soundString = "alarm_\(sender.selectedSegmentIndex + 1)"
        AudioController.nameSound = soundString!
        print("\(AudioController.nameSound)")
    }
    
    @IBAction func ActionVolumeSlider(_ sender: UISlider) {
        let parent = self.presentingViewController as? ViewController
        AudioController.volume = sender.value
        volumeLabel.text = String(Int(sender.value * 100)) + "%"
        AudioController.volume = sender.value
    }
    
    func updateUI(){
        volumeSlider.value = AudioController.volume
        volumeLabel.text = String(Int(volumeSlider.value * 100)) + "%"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
