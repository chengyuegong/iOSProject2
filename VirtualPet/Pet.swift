//
//  Pet.swift
//  VirtualPet
//
//  Created by Chengyue Gong on 2019/1/6.
//  Copyright © 2019 Chengyue Gong. All rights reserved.
//

import Foundation
import UIKit

class Pet {
    // Creative portion: message which indicates pet's current feeling
    enum PetFeeling: String {
        case hungry = "Hungry!"
        case full = "So full!"
        case sad = "Sad:("
        case happy = "Happy:)"
    }
    
    private (set) var color: UIColor
    private (set) var image: UIImage?
    var type: String {
        didSet {
            color = Pet.getColor(type)
            image = Pet.getImage(type)
        }
    }
    private (set) var currentHappiness: Int {
        didSet {
            if (currentHappiness == 0) {
                moodMessage = PetFeeling.sad.rawValue
            } else if (currentHappiness == 10) {
                moodMessage = PetFeeling.happy.rawValue
            } else {
                moodMessage = nil
            }
        }
    }
    private (set) var currentFood: Int {
        didSet {
            if (currentFood == 0) {
                hungerMessage = PetFeeling.hungry.rawValue
            } else if (currentFood == 10) {
                hungerMessage = PetFeeling.full.rawValue
            } else {
                hungerMessage = nil
            }
        }
    }
    private (set) var timeOfBeingPlayed: Int
    private (set) var timeOfBeingFed: Int
    // Creative portion: message which indicates pet's current feeling
    var moodMessage: String?
    var hungerMessage: String?
    
    private init(type: String, color: UIColor, image: UIImage?) {
        self.type = type
        currentHappiness = 0
        currentFood = 0
        timeOfBeingFed = 0
        timeOfBeingPlayed = 0
        self.color = color
        self.image = image
        // Creative portion:
        moodMessage = PetFeeling.sad.rawValue
        hungerMessage = PetFeeling.hungry.rawValue
    }
    
    convenience init(type: String) {
        self.init(type: type, color: Pet.getColor(type), image: Pet.getImage(type))
    }
    
    // Update image for each pet
    private static func getImage(_ type: String) -> UIImage? {
        return UIImage(named: type)
    }
    
    // Update color (background and display Bar) for each pet
    // Cat: #3399CC
    // Dog: #FF0033
    // Bird: #FFCC00
    // Bunny: #33CC66
    // Fish: #CC66FF
    private static func getColor(_ type: String) -> UIColor {
        switch (type) {
        case "cat": return UIColor(red: 51.0/255, green: 153.0/255, blue: 204.0/255, alpha: 1.0)
        case "dog": return UIColor(red: 1.0, green: 0.0, blue: 51.0/255, alpha: 1.0)
        case "bird": return UIColor(red: 1.0, green: 204.0/255, blue: 0.0, alpha: 1.0)
        case "bunny": return UIColor(red: 51.0/255, green: 204.0/255, blue: 102.0/255, alpha: 1.0)
        case "fish": return UIColor(red: 204.0/255, green: 102.0/255, blue: 1.0, alpha: 1.0)
        default: return UIColor.clear
        }
    }
    
    // A pet can only be played with if it’s food level > 0.
    // If a pet is played with, its happiness + 1, and its food level - 1.
    func play() {
        if (currentFood > 0) {
            timeOfBeingPlayed += 1
            currentFood -= 1
            if (currentHappiness < 10) {
                currentHappiness += 1
            }
        }
    }
    
    // If a pet is fed, its food levels + 1
    // Creative portion: add 2 new rules
    func feed() {
        // A pet cannot be fed if its happiness == 0 and its food == 10
        if (currentFood == 10 && currentHappiness == 0) {
            return
        }
        timeOfBeingFed += 1
        if (currentFood < 10) {
            currentFood += 1
        }
            // If a pet is fed when it's full (food level == 10), its happiness - 1;
        else if (currentHappiness > 0) {
            currentHappiness -= 1
        }
    }
}
