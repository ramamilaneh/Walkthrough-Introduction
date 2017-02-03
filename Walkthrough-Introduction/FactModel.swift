//
//  FactModel.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/24/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

struct FactModel {
    
    let title: String
    let message: String
    let imageName: String
    
    static func createFacts() -> [FactModel] {
        
        let fact1 = FactModel(title: "Save Water", message: "Saving water is your decision, we can add here as many facts or text we need ", imageName: "fact1")
        let fact2 = FactModel(title: "Wasting water", message: "You are wasting water every day in bathroom, kitchen, yard", imageName: "fact10")
        let fact3 = FactModel(title: "Stop", message: "Your wasting a lot of water in your shower", imageName: "fact3")
        let fact4 = FactModel(title: "Stop!!!", message: "People are thirsty and you are wasting water", imageName: "fact9")
        let fact5 = FactModel(title: "Water wasting result", message: "Wasting water kills the life of Earth", imageName: "fact4")
        let fact6 = FactModel(title: "How to save water", message: "Check out these ways to save water", imageName: "fact14")
        let fact7 = FactModel(title: "You killed your kids", message: "What you do is affecting you and your family ", imageName: "fact13")
        
        
        return [fact1,fact2,fact3,fact4,fact5,fact6,fact7]

    }
}
