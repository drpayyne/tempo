//
//  AppDelegate.swift
//  Tempo
//
//  Created by Adarsh Manickam on 06/04/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var timer: Timer = Timer()
    var tempo: Int = 0
    var inTempo: Bool = false
    var viewController: ViewController = ViewController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize status item
        statusItem.button?.title = "⏱"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showPopover)
        
        // Get storyboard
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        // Get ViewController
        guard let view = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to find ViewController!")
        }
        
        // Set ViewController
        viewController = view
        
        // Initialize timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        inTempo = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Kill timer
        timer.invalidate()
        inTempo = false
    }

    @objc func showPopover() {
        // Get status item's button
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button!")
        }
        
        // Initialize popover
        let popoverView = NSPopover()
        popoverView.contentViewController = viewController
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY )
        popoverView.contentViewController?.view.window?.makeKey()
    }
    
    @objc func timerCounter() -> Void {
        // Increment tempo
        tempo += 1
        
        // Set formatted tempo to popover's label
        viewController.tempoLabel?.stringValue = makeTempoString(with: tempo)
    }
    
    //   tempo / 3600       - h
    //  (tempo % 3600) / 60 - m
    //  (tempo % 3600) % 60 - s
    func makeTempoString(with tempo: Int) -> String {
        // Format tempo in "1h 1m"
        return "\((tempo / 3600))h \((tempo % 3600) / 60)m"
    }
}

