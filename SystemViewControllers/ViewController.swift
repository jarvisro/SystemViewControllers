//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Jarvis Rojas on 9/21/19.
//  Copyright © 2019 Jarvis Rojas. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
      }


    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
    //This line creates a pointer to the button you tapped graphically.
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion:  nil)
    }
    
    
    
    
    
    
    
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "http://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func photosButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //Comes up and gives and alert or action sheet
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        //cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "photo library", style: .default, handler: { action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        
      
        
        
   
//        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
//            print("User selected Photo Library action")
//        })
//
//        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
//            print("User selected Photo Library action")
//        })
        
     
//
//        alertController.addAction(cameraAction)
//        alertController.addAction(photoLibraryAction)
//        alertController.popoverPresentationController?.sourceView? = sender
//
//
        present(alertController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              
              print("delegate called")
              
              if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                  print("getting image")
              imageView.image = selectedImage
              dismiss(animated: true, completion: nil)
              }
          }
    
    //Send Email from Your App
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail() {
            print("Can not send mail")
            return
        }
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients(["eample@example.com"])
        mailCompose.setSubject("Look at this")
        mailCompose.setMessageBody("Hello this is an email from the app I made", isHTML: false)
        
        present(mailCompose, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func mesaageButtonTapped(_ sender: UIButton) {
        
    }
    
}

