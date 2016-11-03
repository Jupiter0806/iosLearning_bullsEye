//
//  ViewController.swift
//  BullsEye
//
//  Created by Jupiter Li on 3/11/2016.
//  Copyright © 2016 Jupiter Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0;
    var targetVaule: Int = 0;
    var score: Int = 0;
    var round: Int = 0;
    
    @IBOutlet weak var slider: UISlider!;
    
    @IBOutlet weak var targetValue_label: UILabel!;
    @IBOutlet weak var score_label: UILabel!;
    @IBOutlet weak var round_label: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func showAlert() {
        let message = "You socred " + calculateScore() + " points";
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert);
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
            self.startNewRound();
        });
        
        alert.addAction(action);
        
        // in swift 3.0 the function is present();
        presentViewController(alert, animated: true, completion: nil);
        
    }
    
    @IBAction func slliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value);
    }

    func startNewRound() {
        generateNewTargetValue();
        currentValue = 50;
        slider.value = Float(currentValue);
        round += 1;
        updateLabels();
    }
    
    func generateNewTargetValue() {
        targetVaule = 1 + Int(arc4random_uniform(100));
    }
    
    func initialseValues() {
        score = 0;
        round = 0;
    }
    
    func updateLabels() {
        targetValue_label.text = String(targetVaule);
        score_label.text = String(score);
        round_label.text = String(round);
    }
    
    func calculateScore() -> String {
        let currentScore: Int = 100 - abs(currentValue - targetVaule);
        score += currentScore;
        return String(currentScore);
    }
    
}

