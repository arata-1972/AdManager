//
//  ViewController.swift
//  AdManager
//
//  Created by Jakob Mikkelsen on 10/12/17.
//  Copyright © 2017 AppMent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Configure AdManager
        AdManager.shared.setup()

    }

    @IBAction func loadFullscreen() {
        AdManager.shared.loadFullscreenAd()
    }

    @IBAction func showFullscreen() {
        AdManager.shared.showFullscreenAd(forViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

