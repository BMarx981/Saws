//
//  ViewController.swift
//  Saws
//
//  Created by Brian Marx on 11/18/16.
//  Copyright © 2016 Brian Marx. All rights reserved.
//

import UIKit
import AudioKit

let saw1Table = AKTable(.sawtooth)
let saw2Table = AKTable(.sawtooth)
let saw3Table = AKTable(.sawtooth)

class ViewController: UIViewController {
    
    var saw1 = AKOscillator(waveform: saw1Table)
    var saw2 = AKOscillator(waveform: saw2Table)
    var saw3 = AKOscillator(waveform: saw3Table)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mixer = AKMixer(saw1, saw2, saw3)
        AudioKit.output = mixer
        AudioKit.start()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Play/Stop button
    @IBAction func toggleButton(_ sender: UIButton) {
        if saw1.isPlaying {
            saw1.stop()
            saw2.stop()
            saw3.stop()
            sender.setTitle("Play", for: .normal)
            sender.setTitleColor(UIColor.blue, for: .normal)
        } else  {
            saw1.play()
            saw2.play()
            saw3.play()
            sender.setTitle("Stop", for: .normal)
            sender.setTitleColor(UIColor.red, for: .normal)
        }
    }//end play/stop button
    
    //The main Volume slider
    @IBAction func MainAmpSlider(_ sender: UISlider) {
        saw1.frequency = Double(sender.value * 880)
        saw2.frequency = 1.5 * Double(sender.value * 880)
        saw3.frequency = 2 * (Double(sender.value * 880))
    }
    
    //The oscillators amplitudes
    //Osc 1 Amp
    @IBAction func Osc1AmpSlider(_ sender: UISlider) {
        saw1.amplitude = Double(sender.value)
    }
    
    //Osc 2 Amp
    @IBAction func Osc2AmpSlider(_ sender: UISlider) {
        saw2.amplitude = Double(sender.value)
    }
    
    //Osc 3 Amp
    @IBAction func Osc3AmpSlider(_ sender: UISlider) {
        saw3.amplitude = Double(sender.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

