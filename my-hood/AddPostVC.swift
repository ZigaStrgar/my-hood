//
//  AddPostVC.swift
//  my-hood
//
//  Created by Ziga Strgar on 08/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postImage: CustomImage!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func makePostBtnTouched(sender: AnyObject) {
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            let imgPath = DataService.instance.saveImageAndCreatPath(img)
            let post = Post(image: imgPath, title: title, description: desc)
            DataService.instance.storePost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancleBtnTouched(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnTouched(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
}
