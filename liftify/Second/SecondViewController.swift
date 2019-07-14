 //
//  SecondViewController.swift
//  Liftify
//
//  Created by benson on 6/23/19.
//  Copyright © 2019 wu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    
    @IBOutlet var liftButtons: [UIButton]!
    @IBOutlet var selectedLiftLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var repsTextField: UITextField!
    @IBOutlet var submitSetButton: UIButton!
    
    // MARK: - View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        repsTextField.delegate = self
        
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func selectALiftTapped(_ sender: Any) {
        for button in liftButtons {
            UIView.animate(withDuration: 0.3) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded() // tidy up animation
            }
        }
    }
    
    @IBAction func liftTapped(_ sender: UIButton) {
        repsTextField.isHidden = false
        weightTextField.isHidden = false
        selectedLiftLabel.isHidden = false
        if let selectedLift = sender.titleLabel?.text {
            selectedLiftLabel.text = "Best \(selectedLift) Set:"
        }
    }
    
    @IBAction func submitSetButtonTapped(_ sender: Any) {
        print("YOUR SET")
        print("weight: \(weightTextField.text)")
        print("reps: \(repsTextField.text)")
    }
    
    
    // MARK: - TextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if weightTextField.text != nil && repsTextField.text != nil {
            submitSetButton.isHidden = false
        }
        return true
    }
    
}
