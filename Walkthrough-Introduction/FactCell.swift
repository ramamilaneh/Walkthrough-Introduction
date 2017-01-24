//
//  FactCell.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/24/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class FactCell: UICollectionViewCell {
    
    let factImageView = UIImageView()
    
    let factText: UITextView = {
        let tv = UITextView()
        tv.text = "Some Text....."
        tv.isEditable = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInt() {

        setup()

    }
    
    func setup()  {
        
        self.addSubview(factImageView)
        self.addSubview(factText)
        factImageView.contentMode = .scaleAspectFill
        factImageView.clipsToBounds = true
        factImageView.image = UIImage(named: "water-consumption")
        factImageView.backgroundColor = UIColor.yellow
        factImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: factText.topAnchor, right: rightAnchor)
        self.factText.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        self.factText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    }
