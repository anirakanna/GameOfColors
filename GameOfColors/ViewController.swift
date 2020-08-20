//
//  ViewController.swift
//  GameOfColors
//
//  Created by Evgenia Shipova on 20.08.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorfulView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorfulView.layer.cornerRadius = 10
        
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
        changeBackgroundColor()
    }
    
    @IBAction func redSliderAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        changeBackgroundColor()
    }
    
    private func changeBackgroundColor() {
        colorfulView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                                    green: CGFloat(greenSlider.value),
                                                    blue: CGFloat(blueSlider.value),
                                                    alpha: 1)
    }
}

