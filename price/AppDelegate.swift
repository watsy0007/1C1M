//
//  AppDelegate.swift
//  price
//
//  Created by lgh on 15/08/2017.
//  Copyright © 2017 watsy0007. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow?
    @IBOutlet var popover : NSPopover?
    
    fileprivate let icon: IconView;
    
    override init()
    {
        let bar = NSStatusBar.system();
        
        let length: CGFloat = -1 //NSVariableStatusItemLength
        let item = bar.statusItem(withLength: length);
        
        self.icon = IconView(imageName: "btc", item: item);
        item.view = icon;
        
        super.init();
    }


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    override func awakeFromNib()
    {
        let edge = NSRectEdge.minY
        let icon = self.icon
        let rect = icon.frame
        
        icon.onMouseDown = {
            if (icon.isSelected)
            {
                self.popover?.show(relativeTo: rect, of: icon, preferredEdge: edge);
                return
            }
            self.popover?.close()
        }
    }


}

