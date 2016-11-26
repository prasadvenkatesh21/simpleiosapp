//
//  ViewController.swift
//  assignment3
//
//  Created by Venkateshprasad Ashwathnarayana on 10/8/16.
//  Copyright © 2016 Venkateshprasad Ashwathnarayana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var movingLabel: UILabel!
    @IBOutlet var inputText: UITextField!
    @IBOutlet var x: UITextField!
    @IBOutlet var y: UITextField!
    
    var xTemp:Double?
    var yTemp:Double?
    var coordinates = CGPoint(x: 0, y: 0)
    let defaultValue = UserDefaults.standard
    
    @IBAction func updateButton() {
        if (movingLabel.text != nil){
            defaultValue.set(inputText.text, forKey: "inputtext")
            defaultValue.set(x.text!, forKey: "xvar")
            defaultValue.set(y.text!, forKey: "yvar")
        }
        movingLabel.text = inputText.text
        xTemp = Double(x.text!)
        yTemp = Double(y.text!)
        if inputText.text != "" && xTemp != nil && yTemp != nil{
            movingLabel.center = CGPoint(x: xTemp!, y: yTemp!)
        }
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        
        let touch:UITouch! = touches.first! as UITouch
        coordinates = touch.location(in: self.view)
        movingLabel.center = coordinates
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch! = touches.first! as UITouch
        coordinates = touch.location(in: self.view)
        movingLabel.center = coordinates
        x.text = String(describing: coordinates.x)
        y.text = String(describing: coordinates.y)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if ((defaultValue.object(forKey: "inputtext")) != nil)
        {
            inputText.text = defaultValue.string(forKey: "inputtext")
            x.text = defaultValue.string(forKey: "xvar")
            y.text = defaultValue.string(forKey: "yvar")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
