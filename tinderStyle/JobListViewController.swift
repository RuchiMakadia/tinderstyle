//
//  JobListViewController.swift
//  tinderStyle
//
//  Created by eHeuristic on 04/02/21.
//

import UIKit


class JobListViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(named: "AccentColor")
    }
    
    //
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(chosenImage)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btn_open(_ sender: Any) {
        Comman.shared.actionshet(viewcontroller: self, message: "", title: "", delaget: self)
    }
}
