//
//  ViewController.swift
//  tinderStyle
//
//  Created by eHeuristic on 12/11/20.
//

import UIKit
import Shuffle_iOS

class ViewController: UIViewController, SwipeCardStackDataSource, SwipeCardStackDelegate {
    
    @IBOutlet weak var btn_delete: UIButton!
    @IBOutlet weak var btn_save: UIButton!
    @IBOutlet weak var btn_undo: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let cardStack = SwipeCardStack(frame: CGRect(x: 0, y: 100, width: 350, height: 650))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
    let viewsss = UIView(frame: CGRect(x: 30, y: 100, width: 200, height: 200))
    
    
    private var darkShadow: UIColor = UIColor(red: 0.745, green: 0.796, blue: 0.847, alpha: 1.00) //#colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 1)
    private var lightShadow: UIColor = UIColor(red: 0.953, green: 0.976, blue: 1.000, alpha: 1.00) //#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private var bg_color = UIColor(red: 0.871, green: 0.918, blue: 0.965, alpha: 1.00)
     
     let cardImages = [
         UIImage(named: "michelle"),
         UIImage(named: "michelle"),
         UIImage(named: "michelle"),
         UIImage(named: "michelle"),
         UIImage(named: "michelle"),
         UIImage(named: "michelle"),
        UIImage(named: "michelle")
     ]
    
    var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_undo.layer.cornerRadius = 30
        btn_undo.clipsToBounds = true
        setupUI(btn_view: btn_save)
        setupUI(btn_view: btn_delete)
        setupUI(btn_view: btn_undo)
        
        cardStack.dataSource = self
        cardStack.delegate = self
        view.addSubview(cardStack)
        self.cardStack.frame = CGRect(x: 8, y: 64, width: self.view.frame.size.width - 16, height: 650)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(views)
        self.navigationController?.navigationBar.isHidden = true
    }
  
    
    func card(fromImage image: UIImage) -> SwipeCard {
      let card = SwipeCard()
      card.swipeDirections = [.left, .right, .up]
       card.layer.cornerRadius = 25
       card.clipsToBounds = true
      card.content = UIImageView(image: image)
      /*let leftOverlay = UIView()
      leftOverlay.backgroundColor = .green
      let rightOverlay = UIView()
      rightOverlay.backgroundColor = .red*/
     // card.setOverlays([.left: leftOverlay, .right: rightOverlay])
      return card
    }
    

    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card(fromImage: cardImages[index]!)
    }

    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
      return cardImages.count
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
                    vc.modalPresentationStyle = .overCurrentContext
                    self.navigationController?.pushViewController(vc, animated: false)
                            //self.present(vc, animated: false, completion: nil)
                        }
    }
    
    
    func setupUI(btn_view: UIButton) {
        
        /// apply outher shadow to view
        func applyNeumorphismToView1() {
            let lightLayer = CALayer()
            let darkLayer = CALayer()
            // apply common code for layers 😝
            [lightLayer, darkLayer].forEach { (layer) in
                layer.frame = btn_view.bounds
                layer.cornerRadius = 30.0
                layer.backgroundColor = btn_view.backgroundColor?.cgColor
                btn_view.layer.addSublayer(layer)
            }
            btn_view.layer.cornerRadius = 30.0
            // apply neumorphism effect
            lightLayer.applySketchShadow(x: -10.0, y: -10.0, blur: 30.0, spread: 0, color: lightShadow, alpha: 1.0)
            darkLayer.applySketchShadow(x: 10.0, y: 10.0, blur: 30.0, spread: 0, color: darkShadow, alpha: 0.4)
        }
        
        func applyNeumorphismToView2() {
            let lightLayer = CAShapeLayer()
            let darkLayer = CAShapeLayer()
            let cornerRadius: CGFloat = 30.0
            
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
           // applyNeumorphismToView1()
            applyNeumorphismToView2()
        }
    }
}

//Sketch neomorephic
extension CALayer {
  func applySketchShadow(x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0, color: UIColor = .black, alpha: Float = 0.5) {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    }
    else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
