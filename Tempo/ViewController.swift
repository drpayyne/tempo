//
//  ViewController.swift
//  Tempo
//
//  Created by Adarsh Manickam on 06/04/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var tempoLabel: NSTextField!

    var timer: Timer = Timer()
    var tempo: Int = 0
    var inTempo: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tempoLabel.stringValue = "0m 0s"
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() -> Void {
        tempo += 1
        tempoLabel.stringValue = makeTempoString(with: tempo)
    }
    
    //  tempo / 3600        - h
    //  (tempo % 3600) / 60 - m
    //  (tempo % 3600) % 60 - s
    func makeTempoString(with: Int) -> String {
        return "\((tempo / 3600))h \((tempo % 3600) / 60)m"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

