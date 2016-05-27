//
//  InterfaceController.swift
//  DemoWatch WatchKit Extension
//
//  Created by Tushar Sachde on 25/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import WatchKit
import CoreMotion
import Foundation

class InterfaceController: WKInterfaceController {
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    let motionManager = CMMotionManager()
    
    @IBOutlet var rotX: WKInterfaceLabel!
    @IBOutlet var rotY: WKInterfaceLabel!
    @IBOutlet var rotZ: WKInterfaceLabel!
    @IBOutlet var startGyroBtn: WKInterfaceButton!
    
    @IBOutlet var accX: WKInterfaceLabel!
    @IBOutlet var accY: WKInterfaceLabel!
    @IBOutlet var accZ: WKInterfaceLabel!
    @IBOutlet var startAccBtn: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    @IBAction func startAccTap() {
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, error: NSError?) in
            self.outputAccData((accelerometerData?.acceleration)!)
            if (error != nil) {
                print("\(error)")
            }
        }
    }
    
    @IBAction func startGyroTap() {
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!) { (gyroData: CMGyroData?, error: NSError?) in
            self.outputRotationData((gyroData?.rotationRate)!)
            if (error != nil) {
                print("\(error)")
            }
        }
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        
        //        motionManager.stopGyroUpdates()
        //        motionManager.stopAccelerometerUpdates()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func outputAccData(acceleration: CMAcceleration){
        
        accX?.setText("\(acceleration.x).2fg")
        if fabs(acceleration.x) > fabs(currentMaxAccelX)
        {
            currentMaxAccelX = acceleration.x
        }
        
        accY?.setText("\(acceleration.y).2fg")
        if fabs(acceleration.y) > fabs(currentMaxAccelY)
        {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.setText("\(acceleration.z).2fg")
        if fabs(acceleration.z) > fabs(currentMaxAccelZ)
        {
            currentMaxAccelZ = acceleration.z
        }
        
    }
    
    func outputRotationData(rotation: CMRotationRate){
        
        rotX?.setText("\(rotation.x).2fr/s")
        if fabs(rotation.x) > fabs(currentMaxRotX)
        {
            currentMaxRotX = rotation.x
        }
        
        rotY?.setText("\(rotation.y).2fr/s")
        if fabs(rotation.y) > fabs(currentMaxRotY)
        {
            currentMaxRotY = rotation.y
        }
        
        rotZ?.setText("\(rotation.z).2fr/s")
        if fabs(rotation.z) > fabs(currentMaxRotZ)
        {
            currentMaxRotZ = rotation.z
        }
        
    }
    
    
}
