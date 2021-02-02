//
//  ThirdViewController.swift
//  tinderStyle
//
//  Created by eHeuristic on 02/02/21.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5) {
//            self.imageView.layer.masksToBounds = false
//            self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2
//            self.imageView.clipsToBounds = true
            self.imageView.makeRounded()
            self.imageViewHeight.constant = 150/2
        }
    }

    @IBAction func btn_back_select(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
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

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 191
        self.clipsToBounds = true
    }
}
