//
//  ViewController.swift
//  GameOfColors
//
//  Created by Evgenia Shipova on 20.08.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

protocol ResultingColorProtocol {
    var resultingColor: UIColor { get }
}

class NewBackgroundColorViewController: UIViewController, ResultingColorProtocol {
    
    @IBOutlet weak var colorfulView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegete: NewBackgroundColorViewControllerDelegete!
    
    var colorOfFirstVC: UIColor!
    
    var resultingColor: UIColor {
        UIColor(red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        redTextField.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        greenTextField.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        blueTextField.text = string(from: sender)
        default: break
        }
        
        changeBackgroundColor()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        delegete.changeBackgroundColor(resultingColor)
        dismiss(animated: true)
    }
    
    private func updateUI() {
        colorfulView.layer.cornerRadius = 10
        
        colorfulView.backgroundColor = colorOfFirstVC
        
        if let myColorComponents = colorOfFirstVC.components {
            redSlider.value = Float(myColorComponents.red)
            greenSlider.value = Float(myColorComponents.green)
            blueSlider.value = Float(myColorComponents.blue)
        }
        
        setValueLabels(for: redLabel, greenLabel, blueLabel)
        setValueTextFields(for: redTextField, greenTextField, blueTextField)
    }
    
    private func changeBackgroundColor() {
        colorfulView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func setValueLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setValueTextFields(for textFields: UITextField...) {
        textFields.forEach { textfield in
            switch textfield.tag {
            case 0: redTextField.text = string(from: redSlider)
            case 1: greenTextField.text = string(from: greenSlider)
            case 2: blueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setRGBSlider(for sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider.tag {
            case 0: redSlider.setValue(Float(Double(redTextField.text!)!),
                                       animated: true)
            case 1: greenSlider.setValue(Float(Double(greenTextField.text!)!),
                                         animated: true)
            case 2: blueSlider.setValue(Float(Double(blueTextField.text!)!),
                                        animated: true)
            default: break
            }
        }
        
        changeBackgroundColor()
        setValueLabels(for: redLabel, greenLabel, blueLabel)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: Text Field Delegate
extension NewBackgroundColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
        setRGBSlider(for: redSlider, greenSlider, blueSlider)
    }
}

extension UIColor {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? (r,g,b,a) : nil
    }
}

