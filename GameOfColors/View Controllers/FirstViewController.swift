//
//  FirstViewController.swift
//  GameOfColors
//
//  Created by Evgenia Shipova on 03.09.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

protocol NewBackgroundColorViewControllerDelegete {
    func changeBackgroundColor(_ color: UIColor)
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newBackgroundColorVC = segue.destination as! NewBackgroundColorViewController
        newBackgroundColorVC.delegete = self
        newBackgroundColorVC.colorOfFirstVC = view.backgroundColor
    }
}

extension FirstViewController: NewBackgroundColorViewControllerDelegete {
    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
