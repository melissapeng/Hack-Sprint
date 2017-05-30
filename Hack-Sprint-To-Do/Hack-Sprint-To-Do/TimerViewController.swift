//
//  TimerViewController.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/28/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var seconds = 120 //This variable will hold a starting value of seconds. It could be any amount above 0.
    
    var timer = Timer()
    
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func startButton(_ sender: Any) {
        if(isTimerRunning == false){
            runTimer()
        }
    }
    

    
    func runTimer() {
        isTimerRunning = true;
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {

        if seconds < 1 {
            timer.invalidate()
            alert()
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
 //This will update the label.
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func alert(){
        let alert = UIAlertController(title: "", message: "Sorry, your time ran out.  Your picture is currently being published.", preferredStyle: .alert)
    
        
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
