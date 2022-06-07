//
//  ViewController.swift
//  Renetik Layout Demo
//
//  Created by Renetik on 06/06/22.
//

import UIKit
import RenetikLayout

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInfo("test")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.add(view: UILabel.construct(color: .blue).text("Test")
            .text(align: .center).resizeToFit(padding: 30)).centered()
        view.debugLayoutByRandomBackgroundColor()
    }
}

