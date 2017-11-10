//
//  GlobalController.swift
//  William_CSP
//
//  Created by Pearson, William on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

class GlobalController: UIViewController
{
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!

    private func setupGlobal() -> Void
    {
        firstImage.image = UIImage(named: ")
        
        var problemString : String
        problemString = "This problem is worldwide, and there are a large number of deaths amounted to this every single day."
        problemLabel.text = problemString
        
        var personalString : String
        personalString = "This problem is personal to me because there are water problems all over the globe. I have relatives in Oregon which is currently getting into a drought and we are worried for them."
        personalLabel.text = personalString
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setupGlobal()
    }
}
