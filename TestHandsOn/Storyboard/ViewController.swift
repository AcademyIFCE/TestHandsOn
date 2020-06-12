//
//  ViewController.swift
//  TestHandsOn
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testeLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        testeLabel.text = "Time to shine"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myButton.setTitle("bye bye", for: .normal)
    }
}
