//
//  ViewController.swift
//  StarWarsLoginForm
//
//  Created by Marcin Pietrzak on 14.07.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var xwing1: UIImageView!
    @IBOutlet weak var xwing2: UIImageView!
    @IBOutlet weak var xwing3: UIImageView!
    @IBOutlet weak var xwing4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.center.y -= view.bounds.width
        loginTextField.center.x -= view.bounds.width
        passwordTextField.center.x += view.bounds.width
        
        loginButton.alpha = 0.0
        
        xwing1.alpha = 0.0
        xwing2.alpha = 0.0
        xwing3.alpha = 0.0
        xwing4.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
            self.titleLabel.center.y += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.loginTextField.center.x += self.view.bounds.width
            self.passwordTextField.center.x -= self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 2.0, options: [], animations: {
            self.loginButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
            self.xwing1.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [], animations: {
            self.xwing2.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
            self.xwing3.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.2, options: [], animations: {
            self.xwing4.alpha = 1.0
        }, completion: nil)
        
        animateTheXwings(xwing: xwing1)
        animateTheXwings(xwing: xwing2)
        animateTheXwings(xwing: xwing3)
        animateTheXwings(xwing: xwing4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateTheXwings(xwing: UIImageView) {
        let xwingMovingSpeed = 60.0/view.frame.size.width
        let duration = (view.frame.size.width - xwing.frame.origin.x) * xwingMovingSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            xwing.frame.origin.x = self.view.frame.size.width
        }, completion: { _ in
            xwing.frame.origin.x = -xwing.frame.size.width
            self.animateTheXwings(xwing: xwing)
        })
    }


}

