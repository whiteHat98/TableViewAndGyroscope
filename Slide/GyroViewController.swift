//
//  GyroViewController.swift
//  Slide
//
//  Created by Randy Noel on 18/06/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//

import UIKit
import CoreMotion

class GyroViewController: UIViewController {

    @IBOutlet weak var lblGyro: UILabel!
    @IBOutlet weak var switchOnOff: UISwitch!
    @IBOutlet weak var switchPedo: UISwitch!
    
    @IBOutlet weak var lblPedo: UILabel!
    
    let motion = CMMotionManager()
    var timer:Timer? = Timer()
    let pedo = CMPedometer()
    
    @IBAction func `switch`(_ sender: Any) {
        if switchOnOff.isOn {
            startGyro()
        }else if switchOnOff.isOn == false{
            stopGyro()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchOnOff.isOn = false
        // Do any additional setup after loading the view.
      
    }
    
    func startGyro(){
      //  DispatchQueue.main.async {
        
            if self.motion.isGyroAvailable{
            self.motion.gyroUpdateInterval = 1.0/3.0
          //  self.motion.startAccelerometerUpdates()
            self.motion.startGyroUpdates()
            
            
            self.timer = Timer(fire: Date(), interval: (1.0/3.0), repeats: true, block: { (timer) in
                if let data = self.motion.gyroData{
                    let x = data.rotationRate.x
                    let y = data.rotationRate.y
                    let z = data.rotationRate.z
                    print("Gyro  x: ",x ," y: ", y ," z: ", z)
                    //print(data.rotationRate.self)
                    if  -1 < x && x < 1 && -1 < y && y < 1 && -1 < z && z < 1{
                        self.lblGyro.text = "Stable"
                    }else if x > 1 {
                        self.lblGyro.text = "x>1"
                    }else if x < -1 {
                        self.lblGyro.text = "x<-1"
                    }else if y > 1 {
                        self.lblGyro.text = "y>1"
                    }else if y < -1 {
                        self.lblGyro.text = "y<-1"
                    }else if z > 1 {
                        self.lblGyro.text = "z>1"
                    }else if z < -1 {
                        self.lblGyro.text = "z<-1"
                    }
                
                }
//                if let data = self.motion.accelerometerData{
//                    let x = data.acceleration.x
//                    let y = data.acceleration.y
//                    let z = data.acceleration.z
//                    print("Acc  x: ",x ," y: ", y ," z: ", z)
//                }
            })
            
            RunLoop.current.add(self.timer!, forMode: .default)
        }
    //    }
    }

    func stopGyro(){
        if self.timer != nil{
            self.timer?.invalidate()
            self.timer = nil
            
            self.motion.stopGyroUpdates()
        }
    }
    
    
    @IBAction func SwitchPedo(_ sender: Any) {
        if switchPedo.isOn == true{
            startPedo()
        }else{
            pedo.stopUpdates()
        }
    }
    
    
    func startPedo(){
        
        pedo.startUpdates(from: Date()) { (pedometerData, error) in
            if let pedData = pedometerData{
                self.lblPedo.text = ("Steps : \(pedData.numberOfSteps)")
                print("Steps : \(pedData.numberOfSteps)")
            } else {
                self.lblPedo.text = ("Steps : no step")
            }
        }
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
