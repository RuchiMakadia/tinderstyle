//
//  HelperClass.swift
//  tinderStyle
//
//  Created by eHeuristic on 01/03/21.
//

import Foundation
import UIKit

class Comman {
    
    static let shared = Comman()
    let imagePicker = UIImagePickerController()
    
func actionshet(viewcontroller: UIViewController, message: String, title: String, delaget:UIImagePickerControllerDelegate & UINavigationControllerDelegate )
{
    let alert = UIAlertController(title: "Add profile picture", message: "", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { (action) in
        self.opengallry(dalegate: delaget, viewcontroler: viewcontroller)
    }))
    alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
        self.capturephoto(deleagte: delaget, viewcontoroller: viewcontroller)
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    viewcontroller.present(alert, animated: true, completion: nil)
}

//MARK:- OpenImagePicker
private func capturephoto(deleagte: UIImagePickerControllerDelegate & UINavigationControllerDelegate, viewcontoroller: UIViewController)
{
    imagePicker.delegate = deleagte
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        viewcontoroller.present(imagePicker, animated: true, completion: nil)
    }
    else
    {
        let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewcontoroller.present(alert, animated: true, completion: nil)
    }
}

private func opengallry(dalegate: UINavigationControllerDelegate & UIImagePickerControllerDelegate, viewcontroler: UIViewController)
{
    imagePicker.delegate = dalegate //as? UINavigationControllerDelegate & UIImagePickerControllerDelegate
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        viewcontroler.present(imagePicker, animated: true, completion: nil)
    }
    else {
        let alert  = UIAlertController(title: "Warning", message: "You don't have any photo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewcontroler.present(alert, animated: true, completion: nil)
      }
    }
}
