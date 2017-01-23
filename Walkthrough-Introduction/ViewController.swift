//
//  ViewController.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/21/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

   lazy var pagescollectionView: UICollectionView = { [unowned self] in
      let layout = UICollectionViewLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.delegate = self
      cv.dataSource = self
      cv.backgroundColor = UIColor.cyan
        return cv
    }()
    
    let cellIdentifire = "basicCell"
    override func viewDidLoad() {
        super.viewDidLoad()
       view.addSubview(pagescollectionView)
       pagescollectionView.constrainViewToEdges(of: self.view)
       pagescollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifire)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath)
        cell.backgroundColor = UIColor.yellow
        return cell
    }

}

extension UIView {
    
    func constrainViewToEdges(of view: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
