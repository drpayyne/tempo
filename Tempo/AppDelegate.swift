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


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "⏱"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showPopover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showPopover() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to find ViewController!")
        }
        
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button!")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = viewController
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY )
        popoverView.contentViewController?.view.window?.makeKey()
    }
}

