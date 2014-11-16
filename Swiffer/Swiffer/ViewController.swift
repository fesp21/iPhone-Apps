//
//  ViewController.swift
//  Swiffer
//
//  Created by Sandeep on 9/22/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {

    @IBOutlet weak var textView: UITextView? = UITextView()
    
    
    @IBOutlet weak var textLabel: UILabel? = UILabel()
    
    @IBOutlet var imageFile:PFFile? = PFFile()  // DO not know how to share varibles !!!
    
    @IBOutlet var imageView: UIImageView? = UIImageView()
    
    // Image Varible
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        
    }


    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        
        
        let image:UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        
        //Shows Image in the imageView box
        
        var size:CGSize? = imageView?.frame.size
        let newImage = scaleImage(image, size: size!)
        imageView?.image = newImage
        
        
        // Sclaes down image for storing in Parse and converts into PNG
        
        var sizeSweet:CGSize? = CGSizeMake(77, 80)
        let newImageSweet = scaleImage(image, size: sizeSweet!)
        let imageData = UIImagePNGRepresentation(newImageSweet)
        imageFile = PFFile(data: imageData)
        

        
        picker.dismissViewControllerAnimated(true, completion:nil) //Shows the alert View
        
    }
    
    @IBAction func doneTapped(sender: AnyObject) // BUtton to store everything to Parse
    {
        var storeText:PFObject = PFObject(className: "storedText")
        storeText["content"] = textView?.text
        storeText["user"] = PFUser.currentUser()
        storeText["image"] = imageFile
        
        
        storeText.saveInBackground()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    
    
    
    
    
    
    @IBAction func pickImage(sender: AnyObject)
    {
        var imagePicker = UIImagePickerController()
         imagePicker.delegate = self
        
        var imageSource:UIAlertController = UIAlertController(title: "Select Image Source", message: "Camera | Photolibrary", preferredStyle: UIAlertControllerStyle.Alert)
        
        imageSource.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: (
            {
                action in
                    imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                        
                        //= UIImagePickerControllerQualityType.TypeLow
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        )))
        
        imageSource.addAction(UIAlertAction(title: "Library", style: UIAlertActionStyle.Default, handler: (
            {
                action in
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        )))
        

        
         self.presentViewController(imageSource, animated: true, completion: nil)
        
        
        
    }
    
    
    func scaleImage(image:UIImage , size: CGSize) ->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
        
    }

    
    
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        textLabel?.text = "140"

        textView?.layer.borderColor = UIColor.blackColor().CGColor
        textView?.layer.borderWidth = 0.5
        textView?.layer.cornerRadius = 5
        
        textView?.delegate = self
        //textView?.becomeFirstResponder()
    
        
        var tapNotes:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tappedNotes:")
        
        tapNotes.numberOfTapsRequired = 1
        self.textView?.addGestureRecognizer(tapNotes)
        
        


    }
    
    func tappedNotes(tapNotes:UIGestureRecognizer)
    {
        if textView?.text == "Enter your text here"
        {
            self.textView?.text = ""
        }
        self.textView?.becomeFirstResponder()
        println("tappedNotes")
    }
    
    func textView(textView: UITextView,
        shouldChangeTextInRange range: NSRange,
        replacementText text: String) -> Bool
    {
        var newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
        
        var remainingChar = 140 - newLength
        
        textLabel?.text = "\(remainingChar)"
        
        
        return (remainingChar > 0 ? true : false )
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
    }


}

