//
//  CollectionViewCell.swift
//  CollectionViewSelfSizing
//
//  Created by Tintash on 20/06/2019.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var uiImage: UIImageView!
    
    @IBOutlet var maxWidthConstraint: NSLayoutConstraint! {
        didSet{
            maxWidthConstraint.isActive = false
        }
    }
    
    var maxWidth: CGFloat? = nil{
        didSet{
            guard let maxWidth = maxWidth else{
                return
            }
            maxWidthConstraint.isActive = true
            maxWidthConstraint.constant = maxWidth
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
