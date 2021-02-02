//
//  SecondViewController.swift
//  tinderStyle
//
//  Created by eHeuristic on 02/02/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var view_card: UIView!
    @IBOutlet weak var imageVIEW: UIImageView!
    
    private var darkShadow: UIColor = UIColor(red: 0.745, green: 0.796, blue: 0.847, alpha: 1.00) //#colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 1)
    private var lightShadow: UIColor = UIColor(red: 0.953, green: 0.976, blue: 1.000, alpha: 1.00) //#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private var bg_color = UIColor(red: 0.871, green: 0.918, blue: 0.965, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupUI(btn_view: view_card)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        imageVIEW.frame = CGRect(x: 0, y: 64, width: view.frame.size.width, height: 650)
            UIView.animate(withDuration: 0.15, animations: { [weak self] in
                self!.imageVIEW.frame = CGRect(x: 0, y: 0, width: self!.view.frame.size.width, height: 650)
//                self?.imageVIEW.makeRounded()
            })
        }
    
    @IBAction func btn_next_click(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("nuton taped")
    }
    
 
    func setupUI(btn_view: UIView) {
        
        /// apply outher shadow to view
        func applyNeumorphismToView1() {
            let lightLayer = CALayer()
            let darkLayer = CALayer()
            // apply common code for layers 😝
            [lightLayer, darkLayer].forEach { (layer) in
                layer.frame = btn_view.bounds
                layer.cornerRadius = 8.0
                layer.backgroundColor = btn_view.backgroundColor?.cgColor
                btn_view.layer.addSublayer(layer)
            }
            btn_view.layer.cornerRadius = 8.0
            // apply neumorphism effect
            lightLayer.applySketchShadow(x: -10.0, y: -10.0, blur: 30.0, spread: 0, color: lightShadow, alpha: 1.0)
            darkLayer.applySketchShadow(x: 10.0, y: 10.0, blur: 30.0, spread: 0, color: darkShadow, alpha: 0.4)
        }
        
        func applyNeumorphismToView2() {
            let lightLayer = CAShapeLayer()
            let darkLayer = CAShapeLayer()
            let cornerRadius: CGFloat = 8.0
            
            [lightLayer, darkLayer].forEach { (layer) in
                layer.frame = btn_view.bounds
                layer.cornerRadius = cornerRadius
                layer.backgroundColor = UIColor.clear.cgColor
                layer.fillColor = btn_view.backgroundColor?.cgColor
                layer.fillRule = .evenOdd
                let layerPath = UIBezierPath(roundedRect: btn_view.bounds.insetBy(dx: -100.0, dy: -100.0), cornerRadius: cornerRadius)
                layerPath.append(UIBezierPath(roundedRect: btn_view.bounds, cornerRadius: cornerRadius))
                layer.path = layerPath.cgPath
                
                let layerMask = CAShapeLayer()
                layerMask.path = UIBezierPath(roundedRect: btn_view.bounds, cornerRadius: cornerRadius).cgPath
                layer.mask = layerMask
                btn_view.layer.insertSublayer(layer, at: 0)
            }
            
            btn_view.layer.cornerRadius = cornerRadius
            
            lightLayer.shadowColor = lightShadow.cgColor
            lightLayer.shadowOffset = CGSize(width: -10.0, height: -10.0)
            lightLayer.shadowOpacity = 1.0
            lightLayer.shadowRadius = 15/2.0
            
            darkLayer.shadowColor = darkShadow.cgColor
            darkLayer.shadowOffset = CGSize(width: 10.0, height: 10.0)
            darkLayer.shadowOpacity = 0.4
            darkLayer.shadowRadius = 15/2.0
        }
        
        // async after cause at load time may be view doesn't it's actual frame
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            applyNeumorphismToView1()
            //applyNeumorphismToView2()
        }
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
