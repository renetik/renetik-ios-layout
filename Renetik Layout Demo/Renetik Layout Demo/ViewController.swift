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
        let label = UILabel.construct(color: .blue)
        label.text = "test"
        label.textAlignment = .center
        label.resizeToFit(padding:115)
        view.add(view: label).centered()
        view.debugLayoutByRandomBackgroundColor()
    }
}

