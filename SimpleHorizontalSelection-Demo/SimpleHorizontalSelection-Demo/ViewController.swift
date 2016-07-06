//
//  ViewController.swift
//  SimpleHorizontalSelection-Demo
//
//  Created by Bogdan Vitoc on 4/25/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit
import SimpleHorizontalSelection

class ViewController: UIViewController, SHSDelegate {

    @IBOutlet weak var selection: SimpleHorizontalSelectionControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selection.update(["Hi","Hola","Buenos Dias"])
        selection.unselectedTextColor = UIColor.blueColor()
        selection.selectedTextColor = UIColor.greenColor()
        selection.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelect(title: String, index: Int) {
        label.text = title
        print("title: \(title) index: \(index)")
    }


}

