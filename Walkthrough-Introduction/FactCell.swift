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
            // set the titile
            let attributedText = NSMutableAttributedString(string: fact.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            // set the message
            attributedText.append(NSAttributedString(string: "\n\n\(fact.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            // create a paragraph
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
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    // added the line separator between the image and the text
    let lineseparatorView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.7, alpha: 1)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup()  {
        
        self.addSubview(factImageView)
        self.addSubview(factText)
        self.addSubview(lineseparatorView)
        
        factImageView.contentMode = .scaleAspectFill
        factImageView.clipsToBounds = true
        factImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: factText.topAnchor, right: rightAnchor)
        
        self.factText.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        self.factText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        lineseparatorView.anchorToTop(nil, left: leftAnchor, bottom: factText.topAnchor, right: rightAnchor)
        lineseparatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
    }
    
}
