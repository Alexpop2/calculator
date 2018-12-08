//
//  ViewController.swift
//  Calculator
//
//  Created by Рабочий on 01/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var keyboardContainerLeadingLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var keyboardContainerTrailingLayoutConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttonWidth = Int(view.frame.width) / 4
        let containerWidth = CGFloat( buttonWidth * 4 )
        let paddings = ( view.frame.width - containerWidth) / 2
        keyboardContainerLeadingLayoutConstraint.constant = paddings
        keyboardContainerTrailingLayoutConstraint.constant = paddings
        view.layoutIfNeeded()
        
        roundButtons()
    }
    
    private func roundButtons() {
        var baseCornerRadius: CGFloat?
        
        for i in 1...19 {
            guard let button = view.viewWithTag(i) as? UIButton else {
                continue
            }
            
            if baseCornerRadius == nil {
                baseCornerRadius = button.frame.width / 2
            }
            
            button.layer.cornerRadius = baseCornerRadius!
        }
    }
    
    //попробовать сделать еще одно view внутри subview , сделать нужные отступы и вертикал центр, и аспект ратио 4:5 тогда будут квадраты выходить, у квадратов убрать отсупы слева и справа
    //или у текущей вьюхи сделать отсупы, и квадарты убрать отсутпы
    //калькулятор готовый
    // состояния калькулятора енум, ready, 1 число, 2 числа , и переходы между состояниями
    //спроектировать калькулятор по ООП

}

