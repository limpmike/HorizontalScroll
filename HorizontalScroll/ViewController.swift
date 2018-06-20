//
//  ViewController.swift
//  HorizontalScroll
//
//  Created by Miguel Ángel Hernández Muñoz on 6/19/18.
//  Copyright © 2018 Miguel Ángel Hernández Muñoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...2 {
            let view = UIView()
            view.backgroundColor = UIColor.red
            view.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            view.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
            stackView.addArrangedSubview(view)
        }
    }
    
    override func viewDidLayoutSubviews() {
        DispatchQueue.main.async{
            self.scrollViewDidZoom(scrollView: self.scrollView)
        }
    }

    func scrollViewDidZoom(scrollView: UIScrollView) {
        let offsetX = max((scrollView.bounds.width - stackView.frame.width) * 0.5, 0)
        self.scrollView.contentInset = UIEdgeInsetsMake(0, offsetX, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

