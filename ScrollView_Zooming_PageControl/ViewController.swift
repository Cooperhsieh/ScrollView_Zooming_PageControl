//
//  ViewController.swift
//  ScrollView_Zooming_PageControl
//
//  Created by Cooper on 2020/10/15.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for pageView in scrollView.subviews {
            if pageView.isKind(of: UIView.self){
                return pageView
            }
        }
        return nil
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        
        scrollView.setContentOffset(point, animated: true)
        //iOS 14 以上
        pageControl.allowsContinuousInteraction = true
    }
    
    
    
}

    
    
extension ViewController {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = scrollView.contentOffset.x / scrollView.bounds.width
            pageControl.currentPage = Int (page)
        }
        
    }



