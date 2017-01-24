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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInt() {
        
        setupFactImageView()
    }
    
    func setupFactImageView()  {
        
        self.addSubview(factImageView)
        factImageView.contentMode = .scaleAspectFill
        factImageView.clipsToBounds = true
        factImageView.constrainViewToEdges(of: self)
        factImageView.image = UIImage(named: "water-consumption")
        factImageView.backgroundColor = UIColor.yellow
    }
}
