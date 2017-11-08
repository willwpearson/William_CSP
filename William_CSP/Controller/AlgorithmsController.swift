//
//  AlgorithmsController.swift
//  William_CSP
//
//  Created by Pearson, William on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class AlgorithmsController: UIViewController
{
    // MARK: Data members
    @IBOutlet weak var firstLabel: UILabel!
    
    private func setupAlgorithm() -> Void
    {
        var algorithmSteps : [String] = []
        
        let algorithm :String = "These are the instructions to create a projec in Java using Eclipse and Github \n"
        let stepOne :String = "First, create a new project in Eclipse. (File - New - Java Project)"
        let stepTwo :String = "Second, add the packages in the source folder to follow MVC. (Model, View, Controller)"
        let stepThree :String = "Third, create a new repository in Github, with the same name as the project. (File - New Repository)"
        let stepFour :String = "Fourth, undo initial commit in Github, and go to the repository settings. Inside the area called “Ignored Files”, ignore these: bin/, DS_Store, *.class"
        let stepFive :String = "Fifth, make a new commit for the initial commit."
        let stepSix :String = "Sixth, inside the Controller package, add new classes: ProjectController and ProjectRunner."
        let stepSeven :String = "Next, inside the ProjectRunner class, create the main method associated with any project."
        let stepEight :String = "And then, inside the ProjectController class, create the start method associated with that project."
        let stepNine :String = "Finally, write the project."
        
        algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive, stepSix, stepSeven, stepEight, stepNine]
        
        let attributesDictionary = [NSAttributedStringKey.font : firstLabel.font]
        let fullAttributedString = NSMutableAttributedString(string: algorithm, attributes: attributesDictionary)
        
        for step in algorithmSteps
        {
            let bullet :String = "♠︎"
            let formattedStep :String = "\n\(bullet) \(step)"
            let attributedStringStep : NSMutableAttributedString = NSMutableAttributedString(string: formattedStep)
            let paragraphStyle = createParagraphStyle()
            
            attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0,attributedStringStep.length))
            
            fullAttributedString.append(attributedStringStep)
        }
        
        firstLabel.attributedText = fullAttributedString
    }
    
    
    
    override public func viewDidLoad()
    {
        
    }
    
    override public func didReceiveMemoryWarning()
    {
        <#code#>
    }
}
