//
//  AnotherTableViewCell.swift
//  UITableView
//
//  Created by Tintash on 21/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class AnotherTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("AnotherCell is initialized")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("AnotherCell is initialized with coder")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("AnotherCell is awaken from nib")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("Preparing anothercell for reuse")
        print(self.textLabel?.text)
    }

}
