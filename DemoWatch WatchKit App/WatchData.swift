//
//  WatchData.swift
//  DemoWatch
//
//  Created by Tushar Sachde on 25/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import WatchKit
import HealthKit
import CoreMotion
import Foundation

class WatchDataController: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
