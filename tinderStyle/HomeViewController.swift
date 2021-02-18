//
//  HomeViewController.swift
//  tinderStyle
//
//  Created by eHeuristic on 04/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    private let titles = [[
            "America",
            "Bangladesh",
            "China",
            "Denmark",
            "Egypt",
            "Finland Finland",
            "Germany 123",
            "Holand",
            "Italy",
            "Japan"
        ],[
            "iOS",
            "Android",
            "Web"
        ]]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    @IBOutlet weak var btn_4: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let a1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    let b1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JobListViewController") as! JobListViewController
    let c1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SavedListViewController") as! SavedListViewController
    let d1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*collectionView.delegate = self
        collectionView.dataSource = self*/
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
      //collectionView.collectionViewLayout = layout
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * 4, height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        scrollView.contentSize.height = 1.0
        scrollView.delegate = self
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        
        btn_1.backgroundColor = .black
        btn_2.backgroundColor = .clear
        btn_3.backgroundColor = .clear
        btn_4.backgroundColor = .clear
        
        a1.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(a1.view)
        self.addChild(a1)
    }
    
    private func table_view_constint(){
        let view_card = UIView(frame: CGRect.zero)
        view_card.translatesAutoresizingMaskIntoConstraints = false
        view_card.backgroundColor = UIColor.gray
        
        view_card.leadingAnchor.constraint(equalTo: view_card.leadingAnchor, constant: 10).isActive = true
        view_card.trailingAnchor.constraint(equalTo: view_card.trailingAnchor, constant: 10).isActive = true
        view_card.topAnchor.constraint(equalTo: view_card.topAnchor, constant: 10).isActive = true
    }
    
    @IBAction func btn_1_selected(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
    
    @IBAction func btn_2_selected(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: false)
    }
    @IBAction func btn_3_selected(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * 2, y: 0), animated: false)
    }
    @IBAction func btn_4_selected(_ sender: Any) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * 3, y: 0), animated: false)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        if pageControl.currentPage == 0 {
            btn_1.backgroundColor = .black
            btn_2.backgroundColor = .clear
            btn_3.backgroundColor = .clear
            btn_4.backgroundColor = .clear
        }
        else if pageControl.currentPage == 1{
            btn_1.backgroundColor = .clear
            btn_2.backgroundColor = .black
            btn_3.backgroundColor = .clear
            btn_4.backgroundColor = .clear
            
        }
        else if pageControl.currentPage == 2{
            btn_1.backgroundColor = .clear
            btn_2.backgroundColor = .clear
            btn_3.backgroundColor = .black
            btn_4.backgroundColor = .clear
        }
        else if pageControl.currentPage == 3{
            btn_1.backgroundColor = .clear
            btn_2.backgroundColor = .clear
            btn_3.backgroundColor = .clear
            btn_4.backgroundColor = .black
        }
        
        /*if scrollView.contentOffset == CGPoint(x: 0, y: 0) {
            a1.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(a1.view)
            self.addChild(a1)
            
        }*/
         if scrollView.contentOffset == CGPoint(x: scrollView.frame.size.width, y: 0) {
            b1.view.frame = CGRect(x: view.frame.width * 1, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(b1.view)
        }
        else if scrollView.contentOffset == CGPoint(x: scrollView.frame.size.width * 2, y: 0) {
            c1.view.frame = CGRect(x: view.frame.width * 2, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(c1.view)
            self.addChild(c1)
        }
        else if scrollView.contentOffset == CGPoint(x: scrollView.frame.size.width * 3, y: 0) {
            d1.view.frame = CGRect(x: view.frame.size.width * 3, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(d1.view)
            self.addChild(d1)
        }
    }
}

