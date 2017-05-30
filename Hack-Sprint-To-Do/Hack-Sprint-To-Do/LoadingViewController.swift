//
//  LoadingViewController.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/28/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func myAddImage(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    let picker = UIImagePickerController()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage

        
        myImageView.image = pickedImage

        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
        
        
        
        //styles
        myImageView.layer.cornerRadius = 135
        myImageView.layer.masksToBounds = true
        myImageView.clipsToBounds = true
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
