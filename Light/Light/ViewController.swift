//
//  ViewController.swift
//  Light
//
//  Created by Mohamed Hamed on 2/9/21.
//

import UIKit




class ViewController: UIViewController {
    
    var lightOn = true
    
   /* @IBOutlet var lightButton: UIButton!*/
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        
        lightOn.toggle()
        
        updateUI()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        updateUI()
    }

    func updateUI(){
        if lightOn{
            
            view.backgroundColor = .white
            /*lightButton.setTitle("Off", for: .normal)*/
            
        }
        else{
            
            view.backgroundColor = .black
            /*lightButton.setTitle("On", for: .normal)*/
            
        }
        
    }
    
    
}

