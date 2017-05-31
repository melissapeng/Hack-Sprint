//
//  TimerViewController.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/28/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var seconds = 60*30 //This variable will hold a starting value of seconds. It could be any amount above 0.
    
    var timer = Timer()
    
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    let shareData = Shared.shared.chosenMinutes
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBAction func startButton(_ sender: Any) {
        if(isTimerRunning == false){
            runTimer()
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        congrats()
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
            secondLabel.text = secondTime(time: TimeInterval(seconds))
        }
        
        
    //This will update the label.
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60

        return String(minutes)
    }
    
    func secondTime(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        let milliseconds = Int(time) % 60 % 60
        
        return String(format:"%02i sec", seconds, milliseconds)
    }
    
    func alert(){
        let alert = UIAlertController(title: "", message: "Sorry, your time ran out.  Your picture is currently being published.", preferredStyle: .alert)
    
        
        present(alert, animated: true, completion: nil)

    }
    
    func congrats(){
        let congrats = UIAlertController(title: "CONGRATULATIONS", message: "YOU ESCAPED YOUR MODERN DAY DOOM", preferredStyle: .alert)
        
        
        let done = UIAlertAction(title: "Done", style: .cancel){
            (action) in
            
        }
        
        congrats.addAction(done)
        
        present(congrats, animated: true, completion: nil)

    }
    
    
    
    @IBOutlet weak var blueDot: UILabel!
    
    @IBOutlet weak var pinkDot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        seconds = shareData! * 60
        
        
        //styles
        blueDot.layer.masksToBounds = true;
        pinkDot.layer.masksToBounds = true;
        
        blueDot.layer.cornerRadius = 3
        pinkDot.layer.cornerRadius = 3
        
        doneButton.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "DIN Light", size: 12)!], for: UIControlState.normal)
        backButton.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "DIN Light", size: 12)!], for: UIControlState.normal)
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
