//
//  ViewController.swift
//  DemoWatch
//
//  Created by Tushar Sachde on 25/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var heartLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ABC");
        
           let motionKit = MotionKit()
        
        motionKit.getAccelerometerValues(1.0){
            (x, y, z) in
            print(x)
            print(y)
            print(z)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

