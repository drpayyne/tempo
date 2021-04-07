//
//  ViewController.swift
//  Tempo
//
//  Created by Adarsh Manickam on 06/04/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var tempo: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        tempo.stringValue = "Hello!"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

