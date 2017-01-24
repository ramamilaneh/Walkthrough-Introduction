//
//  ViewController.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/21/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var factsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0 // To get rid of the spacing between pages
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = UIColor.white
        cv.isPagingEnabled = true 
        return cv
    }()
    
    let cellIdentifire = "factCell"
    var facts = [FactModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(factsCollectionView)
        factsCollectionView.constrainViewToEdges(of: self.view)
        factsCollectionView.register(FactCell.self, forCellWithReuseIdentifier: cellIdentifire)
        factsCollectionView.backgroundColor = UIColor.cyan
        self.facts = createFacts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as! FactCell
        cell.fact = facts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func createFacts() -> [FactModel] {
        
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

