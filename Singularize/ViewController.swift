//
//  ViewController.swift
//  Singularize
//
//  Created by Andrew Goodwin on 6/18/19.
//  Copyright © 2019 DevDrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let singularize = Singularize()
        
        //let singular = "grapes"
        
        let plural = "grapes"
        
        let matching = singularize.removePluralization(word: plural)
        
        let isWord = singularize.isValidWord(word: plural)
        
        print(isWord)
        
        print(matching)
    }


}

