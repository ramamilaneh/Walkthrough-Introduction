//
//  FactCell.swift
//  Walkthrough-Introduction
//
//  Created by Rama Milaneh on 1/24/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class FactCell: UICollectionViewCell {
    
    var fact: FactModel? {
        didSet {
            guard let fact = fact else {return}
            self.factImageView.image = UIImage(named: fact.imageName)
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: fact.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(fact.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            factText.attributedText = attributedText

        }
    }
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
        factImageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: factText.topAnchor, right: rightAnchor)
        self.factText.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        self.factText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    }
