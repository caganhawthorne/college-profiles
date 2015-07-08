//
//  DetailViewController.swift
//  Cagan College
//
//  Created by Julianne Knott on 7/7/15.
//  Copyright © 2015 Julianne Knott. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField:UITextField!
    var college : College!
    
    @IBOutlet weak var websiteTextField: UITextField!

    
    @IBOutlet weak var backgroundView: UIView!
    var imagePicker : UIImagePickerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        websiteTextField.text = String(college.web)
        imageView.image = college.image
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func onScreenTapped(sender: UITapGestureRecognizer) {
        if(CGRectContainsPoint(imageView.frame, sender.locationInView(backgroundView))) {
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)


            
        }
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { ()->Void in
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imageView.image = image
            }
        }
    }



    
    @IBAction func webButtonTapped(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: college.web)!)
    }

    
    
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.image = imageView.image!
        college.web = websiteTextField.text!
        
        
        
    }
}
