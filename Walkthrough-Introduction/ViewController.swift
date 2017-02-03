//
//  ViewController.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/21/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var facts = [FactModel]()
    let cellIdentifire = "factCell"
    let loginCellId = "loginCellId"
    let pageController = UIPageControl()
    let skipButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    var pageControllerBottomAnchor : NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    // ceate collection view
    lazy var factsCollectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0 // To get rid of the spacing between pages
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.facts = FactModel.createFacts()
        configureViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Get the number of the current page to make the page controller track it
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x/self.view.frame.width)
        pageController.currentPage = pageNumber
        
        //we are on the last page
        if pageNumber == facts.count {
            pageControllerBottomAnchor?.constant = 40
            skipButtonTopAnchor?.constant = -40
            nextButtonTopAnchor?.constant = -40
        } else {
            //back on regular pages
            pageControllerBottomAnchor?.constant = 0
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count + 1
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == facts.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as! FactCell
        cell.fact = facts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func configureViews() {
        let textColor = UIColor(red: 232/255, green: 12/255, blue: 122/255, alpha: 1)
        view.addSubview(factsCollectionView)
        view.addSubview(pageController)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        factsCollectionView.constrainViewToEdges(of: self.view)
        factsCollectionView.register(FactCell.self, forCellWithReuseIdentifier: cellIdentifire)
        factsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)
        factsCollectionView.backgroundColor = UIColor.white
        factsCollectionView.backgroundColor = UIColor.white
        factsCollectionView.isPagingEnabled = true

        
        pageController.pageIndicatorTintColor = UIColor.lightGray
        pageController.currentPageIndicatorTintColor = textColor
        pageController.numberOfPages = self.facts.count + 1
        pageControllerBottomAnchor = pageController.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)[1]

        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(textColor, for: .normal)
        skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        skipButtonTopAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0 , widthConstant: 50, heightConstant: 50).first
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(textColor, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextButtonTopAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 10 , widthConstant: 50, heightConstant: 50).first
        
    }
}

