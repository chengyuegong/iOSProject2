//
//  ViewController.swift
//  VirtualPet
//
//  Created by Chengyue Gong on 2019/1/4.
//  Copyright © 2019 Chengyue Gong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cat = Pet(type: "cat")
    let dog = Pet(type: "dog")
    let bird = Pet(type: "bird")
    let bunny = Pet(type: "bunny")
    let fish = Pet(type: "fish")
    var currentPet: Pet!
    
    @IBOutlet weak var playTimes: UILabel!
    @IBOutlet weak var feedTimes: UILabel!
    // Creative portion: pet's feeling label
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodLevelBar: DisplayView!
    @IBOutlet weak var petView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func updateAll() {
        updateColor()
        updateImage()
        updateDisplay()
    }
    
    func updateDisplay() {
        playTimes.text = "Played: \(currentPet.timeOfBeingPlayed)"
        feedTimes.text = "Fed: \(currentPet.timeOfBeingFed)"
        happinessBar.animateValue(to: CGFloat(Double(currentPet.currentHappiness)/10))
        foodLevelBar.animateValue(to: CGFloat(Double(currentPet.currentFood)/10))
        // Creative portion: update feeling label
        moodLabel.text = currentPet.moodMessage
        hungerLabel.text = currentPet.hungerMessage
    }
    
    func updateColor() {
        happinessBar.color = currentPet.color
        foodLevelBar.color = currentPet.color
        petView.backgroundColor = currentPet.color
    }
    
    func updateImage() {
        imageView.image = currentPet.image
    }
    
    @IBAction func feetPet(_ sender: UIButton) {
        currentPet.feed()
        updateDisplay()
    }
    
    @IBAction func playPet(_ sender: UIButton) {
        currentPet.play()
        updateDisplay()
    }
    
    @IBAction func switch2Dog(_ sender: UIButton) {
        currentPet = dog
        updateAll()
    }
    
    @IBAction func switch2Cat(_ sender: UIButton) {
        currentPet = cat
        updateAll()
    }
    
    @IBAction func switch2Bird(_ sender: UIButton) {
        currentPet = bird
        updateAll()
    }
    
    @IBAction func switch2Bunny(_ sender: UIButton) {
        currentPet = bunny
        updateAll()
    }
    
    @IBAction func switch2Fish(_ sender: UIButton) {
        currentPet = fish
        updateAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentPet = cat
        updateAll()
    }
    
}

