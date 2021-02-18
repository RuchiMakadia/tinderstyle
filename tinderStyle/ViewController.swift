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
    let cardStack = SwipeCardStack(frame: CGRect(x: 0, y: 16, width: 392, height: 650))
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
    
    let txt_name = [
       "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven"
    ]
    
    var views: [UIView] = []
    
    private let titles = [
            "America",
            "Bangladesh",
            "China",
            "Denmark",
            "Egypt",
            "Finland Finland",
            "Germany 123934"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_undo.layer.cornerRadius = 30
        btn_undo.clipsToBounds = true
        setupUI(btn_view: btn_save)
        setupUI(btn_view: btn_delete)
        setupUI(btn_view: btn_undo)
        
        cardStack.dataSource = self
        cardStack.delegate = self
        //cardStack.accessibilityIgnoresInvertColors = true
       // cardStack.isUserInteractionEnabled = true
       // cardStack.isAccessibilityElement = true
        //cardStack.accessibilityTraits = .staticText
        //cardStack.accessibilityTraits = .causesPageTurn
       // cardStack.accessibilityTraits = .allowsDirectInteraction
        //cardStack.accessibilityLabel = "heyo"
        view.addSubview(cardStack)
        self.cardStack.frame = CGRect(x: 8, y: 0, width: self.view.frame.size.width - 16, height: self.view.frame.height * 0.75)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(views)
        self.navigationController?.navigationBar.isHidden = true
    }
  
    func card(fromImage image: UIImage, str: String) -> SwipeCard {
      let card = SwipeCard()
       card.swipeDirections = [.left, .right, .up]
       card.layer.cornerRadius = 25
       card.clipsToBounds = true
        card.layer.borderColor = UIColor.systemBlue.cgColor
        card.layer.borderWidth = 2

        let view_bg = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 16, height: self.view.frame.height * 0.75))
       // card.content = UIView(frame: CGRect.zero) //UIImageView(image: image)
        //card.content?.backgroundColor = .gray
        //card.content?.translatesAutoresizingMaskIntoConstraints = false
        //view_bg.translatesAutoresizingMaskIntoConstraints  = false
        //view_bg.backgroundColor = .gray
        //card.content?.addSubview(view_bg)
        print(card.content?.frame.size.width)
        print(view_bg.frame.size.width)
        card.content = view_bg
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
        let view_bg1 = UIView(frame: CGRect(x: 0, y: 0, width: view_bg.frame.size.width, height: view_bg.frame.size.height))
        view_bg1.backgroundColor = .white
        card.content?.addSubview(view_bg1)
       
        let image_user = UIImageView(frame: CGRect(x: 24, y: 24, width: 100, height: 100))
        image_user.backgroundColor = .gray
        image_user.translatesAutoresizingMaskIntoConstraints = false
        image_user.layer.cornerRadius = 50
        image_user.clipsToBounds = true
        view_bg1.addSubview(image_user)
        
        image_user.topAnchor.constraint(equalTo: view_bg1.topAnchor, constant: 24).isActive = true
        image_user.leadingAnchor.constraint(equalTo: view_bg1.leadingAnchor, constant: 24).isActive = true
        image_user.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image_user.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let c_name = UILabel(frame: CGRect.zero)
        c_name.text = "Eheuristic Solution Private Limited"
        c_name.translatesAutoresizingMaskIntoConstraints = false
        c_name.textColor = .systemBlue
        c_name.numberOfLines = 0
//        c_name.minimumScaleFactor = 0.2
         let font = UIFont(name: FontsName.UnitRoundedOT.UnitRoundedOT_Bold, size: 30)
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        c_name.font = fontMetrics.scaledFont(for: font!)
        print(fontMetrics)//body
        
        
    //    myBoldLabel.font = UIFont(descriptor: .preferredDescriptor(textStyle: .body, styleBold: true), size: 0)

      //  myNormalLabel.font = UIFont(descriptor: .preferredDescriptor(textStyle: .body), size: 0)
      //  c_name.adjustsFontForContentSizeCategory = true
        
      //  c_name.font = UIFont.preferredFont(forTextStyle: .title1)
       // c_name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view_bg1.addSubview(c_name)
        
        c_name.leadingAnchor.constraint(equalTo: image_user.trailingAnchor, constant: 24).isActive = true
        c_name.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
        c_name.centerYAnchor.constraint(equalToSystemSpacingBelow: image_user.centerYAnchor, multiplier: 1).isActive = true
     //   c_name.topAnchor.constraint(equalTo: view_bg1.topAnchor, constant: 24).isActive = true
        
        
        let job_title = UILabel(frame: CGRect.zero)
        job_title.text = "iOS Developer"
        job_title.translatesAutoresizingMaskIntoConstraints = false
        job_title.textColor = .systemBlue
        job_title.numberOfLines = 0
         let font1 = UIFont(name: FontsName.UnitRoundedOT.UnitRoundedOT_Bold, size: 30)
            let fontMetrics1 = UIFontMetrics(forTextStyle: .body)
        print(fontMetrics)//body
        job_title.font = fontMetrics1.scaledFont(for: font1!)
        view_bg1.addSubview(job_title)
        
        job_title.topAnchor.constraint(equalTo: image_user.bottomAnchor, constant: 50).isActive = true
        job_title.leadingAnchor.constraint(equalTo: view_bg1.leadingAnchor, constant: 24).isActive = true
        job_title.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
     //   c_name.centerYAnchor.constraint(equalToSystemSpacingBelow: image_user.centerYAnchor, multiplier: 1).isActive = true
        
        
        
    //    myBoldLabel.font = UIFont(descriptor: .preferredDescriptor(textStyle: .body, styleBold: true), size: 0)

      //  myNormalLabel.font = UIFont(descriptor: .preferredDescriptor(textStyle: .body), size: 0)
      //  c_name.adjustsFontForContentSizeCategory = true
        
      //  c_name.font = UIFont.preferredFont(forTextStyle: .title1)
       // c_name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view_bg1.addSubview(c_name)
        
        c_name.leadingAnchor.constraint(equalTo: image_user.trailingAnchor, constant: 24).isActive = true
        c_name.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
     //   c_name.centerYAnchor.constraint(equalToSystemSpacingBelow: image_user.centerYAnchor, multiplier: 1).isActive = true
        c_name.topAnchor.constraint(equalTo: view_bg1.topAnchor, constant: 24).isActive = true
        
        
        
      //  let flowLayout = UICollectionViewFlowLayout()
            
            
            let location = UILabel(frame: CGRect.zero)
            location.text = "Location: NewYork City"
            location.textColor = .systemGray
            location.translatesAutoresizingMaskIntoConstraints = false
            location.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: FontsName.UnitRoundedOT.UnitRoundedOT_Bold, size: 20)!)
            view_bg1.addSubview(location)
            
            
            location.leadingAnchor.constraint(equalTo: view_bg1.leadingAnchor, constant: 24).isActive = true
            location.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
            location.topAnchor.constraint(equalTo: job_title.bottomAnchor, constant: 24).isActive = true
            
            
            let exp = UILabel(frame: CGRect.zero)
            exp.text = "Experience: 2 Yrs"
            exp.textColor = .systemGray
            exp.translatesAutoresizingMaskIntoConstraints = false
            exp.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: FontsName.UnitRoundedOT.UnitRoundedOT_Bold, size: 20)!)
            view_bg1.addSubview(exp)
            
            exp.leadingAnchor.constraint(equalTo: view_bg1.leadingAnchor, constant: 24).isActive = true
            exp.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
            exp.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 24).isActive = true
            
            let skill = UILabel(frame: CGRect.zero)
            skill.text = "Skills: "
            skill.textColor = .systemGray
            skill.translatesAutoresizingMaskIntoConstraints = false
            skill.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont(name: FontsName.UnitRoundedOT.UnitRoundedOT_Bold, size: 20)!)
            view_bg1.addSubview(skill)
            
            skill.leadingAnchor.constraint(equalTo: view_bg1.leadingAnchor, constant: 24).isActive = true
            skill.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -24).isActive = true
            skill.topAnchor.constraint(equalTo: exp.bottomAnchor, constant: 24).isActive = true
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        collectionView.backgroundColor = .clear
        collectionView.register(nib, forCellWithReuseIdentifier: "TagCollectionViewCell")
        view_bg1.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.leadingAnchor.constraint(equalTo: skill.leadingAnchor, constant: 60).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view_bg1.trailingAnchor, constant: -8).isActive = true
        collectionView.topAnchor.constraint(equalTo: skill.topAnchor, constant: -30).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
        
       /* card.content?.isUserInteractionEnabled = true
        card.content?.isAccessibilityElement = true
        card.content?.accessibilityTraits = .staticText
      //  card.content?.accessibilityLabel = "heyo"
        card.content?.accessibilityLabel = "ruchi"
        card.content?.subviews.compactMap{$0.isAccessibilityElement = true}
        card.content?.subviews.compactMap{$0.accessibilityTraits = .staticText}
        card.content?.subviews.compactMap{$0.accessibilityTraits = .staticText}*/
        //first?.isAccessibilityElement = true
       /* let viewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
       // viewFooter.isAccessibilityElement = true
       // viewFooter.isUserInteractionEnabled = true
        
        let lbl_name = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        lbl_name.isAccessibilityElement = true
        lbl_name.accessibilityLabel = str //"ruchi"
        lbl_name.accessibilityTraits = .staticText
        lbl_name.setTitle("hello there", for: .normal)
        lbl_name.addTarget(self, action: #selector(btn_select), for: .touchUpInside)
        viewFooter.addSubview(lbl_name)*/
       // card.footer = viewFooter
        //card.footerHeight = 100
      /*let leftOverlay = UIView()
      leftOverlay.backgroundColor = .green
      let rightOverlay = UIView()
      rightOverlay.backgroundColor = .red*/
     // card.setOverlays([.left: leftOverlay, .right: rightOverlay])
      return card
    }
    

    @objc func btn_select(){
        print("selcted")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card(fromImage: cardImages[index]!, str: txt_name[index])
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

/*extension UIFontDescriptor {
    /*private struct FontFamily {
        static var preferredFontNameRegular: String = "Montserrat-Regular"
        static var preferredFontNameBold: String = "Montserrat-Bold"
    }*/
    
    struct UnitRoundedOT {
        static let UnitRoundedOT_Bold = "UnitRoundedOT-Bold"
    }
    
    static let fontSizeTable: [UIFont.TextStyle: [UIContentSizeCategory: CGFloat]] = [
    .headline: [
        .accessibilityExtraExtraExtraLarge: 23,
        .accessibilityExtraExtraLarge: 23,
        .accessibilityExtraLarge: 23,
        .accessibilityLarge: 23,
        .accessibilityMedium: 23,
        .extraExtraExtraLarge: 23,
        .extraExtraLarge: 21,
        .extraLarge: 19,
        .large: 17,
        .medium: 16,
        .small: 15,
        .extraSmall: 14
    ],
    .subheadline: [
        .accessibilityExtraExtraExtraLarge: 21,
        .accessibilityExtraExtraLarge: 21,
        .accessibilityExtraLarge: 21,
        .accessibilityLarge: 21,
        .accessibilityMedium: 21,
        .extraExtraExtraLarge: 21,
        .extraExtraLarge: 19,
        .extraLarge: 17,
        .large: 15,
        .medium: 14,
        .small: 13,
        .extraSmall: 12
    ],
    .body: [
        .accessibilityExtraExtraExtraLarge: 53,
        .accessibilityExtraExtraLarge: 47,
        .accessibilityExtraLarge: 40,
        .accessibilityLarge: 33,
        .accessibilityMedium: 28,
        .extraExtraExtraLarge: 23,
        .extraExtraLarge: 21,
        .extraLarge: 19,
        .large: 17,
        .medium: 16,
        .small: 15,
        .extraSmall: 14
    ],
    .caption1: [
        .accessibilityExtraExtraExtraLarge: 18,
        .accessibilityExtraExtraLarge: 18,
        .accessibilityExtraLarge: 18,
        .accessibilityLarge: 18,
        .accessibilityMedium: 18,
        .extraExtraExtraLarge: 18,
        .extraExtraLarge: 16,
        .extraLarge: 14,
        .large: 12,
        .medium: 11,
        .small: 11,
        .extraSmall: 11
    ],
    .caption2: [
        .accessibilityExtraExtraExtraLarge: 17,
        .accessibilityExtraExtraLarge: 17,
        .accessibilityExtraLarge: 17,
        .accessibilityLarge: 17,
        .accessibilityMedium: 17,
        .extraExtraExtraLarge: 17,
        .extraExtraLarge: 15,
        .extraLarge: 13,
        .large: 11,
        .medium: 11,
        .small: 11,
        .extraSmall: 11
    ],
    .footnote: [
        .accessibilityExtraExtraExtraLarge: 19,
        .accessibilityExtraExtraLarge: 19,
        .accessibilityExtraLarge: 19,
        .accessibilityLarge: 19,
        .accessibilityMedium: 19,
        .extraExtraExtraLarge: 19,
        .extraExtraLarge: 17,
        .extraLarge: 15,
        .large: 13,
        .medium: 12,
        .small: 12,
        .extraSmall: 12
    ]
]
    
    final class func preferredDescriptor(textStyle: UIFont.TextStyle, styleBold: Bool = false) -> UIFontDescriptor {
        let contentSize = UIApplication.shared.preferredContentSizeCategory
                
        let fontFamily = styleBold ? UnitRoundedOT.UnitRoundedOT_Bold : UnitRoundedOT.UnitRoundedOT_Bold
        
        guard let style = fontSizeTable[textStyle], let size = style[contentSize] else {
            return UIFontDescriptor(name: fontFamily, size: 16)
        }
        return UIFontDescriptor(name: fontFamily, size: size)
    }
}*/

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        cell.lblTag.text = titles[indexPath.row]
        //cell.backgroundColor = .clear
        cell.lblTag.preferredMaxLayoutWidth = collectionView.frame.width - 32
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 30)
    }
}

/*struct AppFont {
    static func getRegular(forStyle style: UIFont.TextStyle) -> UIFont? {
        R.font.poppinsRegular(size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
    static func getSemiBold(forStyle style: UIFont.TextStyle) -> UIFont? {
        R.font.poppinsSemiBold(size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }

    static func getLight(forStyle style: UIFont.TextStyle) -> UIFont? {
        R.font.poppinsLight(size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
}*/
