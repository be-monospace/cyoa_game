//
//  ViewController.swift
//  MadLibs
//
//  Created by Beatriz Novais on 31/03/20.
//  Copyright © 2020 Beatriz Novais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// OUTLETS (to acess properties inputed by user)
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var verbTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberSlider: UISlider!
    
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    
    @IBOutlet weak var happyEndingSwitch: UISwitch!
    
    //Window view for MORE or LESS segmented control selection
    @IBOutlet weak var containerView: UIView!
    
// ACTIONS (I want a method to be evoked when user interacts)
    
    // Hide or show the container view
    @IBAction func lessOrMoreValueDidChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            containerView.isHidden = true
        } else if sender.selectedSegmentIndex == 1 {
            containerView.isHidden = false
        }
    }
    
    // Update the label next to the slider with the slider value
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        numberLabel.text = "\(Int(sender.value))"
    }
    
    // Update the number of pets label based on the stepper number of presses
    @IBAction func stepperDidChanged(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func createStoryDidTapped(_ sender: UIButton) {
        let animal = animalSegmentedControl.titleForSegment(at: animalSegmentedControl.selectedSegmentIndex)
        // Ternary operand - assign different values to a constant, pedepnding on the first operand (in this case happyEndingSitch.isOn - if so do ? if not do :)
        let happyEnding = happyEndingSwitch.isOn ? "Now they lived happily ever after" : "Things didn't workout"
        let story = "At age of \(ageTextField.text!) , \(firstNameTextField.text!) took a trip to \(locationTextField.text!) with \(Int(numberOfPetsStepper.value) ) pets in order to \(verbTextField.text!) with a \(animal!). Bob decided to buy \(Int(numberSlider.value)). \(happyEnding)"
        
        print(story)
        
        //CREATING AlertControler
        // Creating the pop-up window with the story creatd
        let alertControler = UIAlertController(title: "Here is your story:", message: story, preferredStyle: .alert)
        // Alert controls can have a dismiss button, here is the object for it - note, this button is called action
        
        // CONFIGURING Alert Controler
        let action = UIAlertAction(title: "OK", style: .default, handler: nil )
        // I need to add the action (button) to the alert pop-up by asigning the action constant
        alertControler.addAction(action)
        
        //PRESENTING Alert Controler
        // we then need to tell the alert controler to be exhibited on the screen
        present(alertControler, animated: true, completion: nil)
    }
    
}

