//
//  TableViewCell.swift
//  UITableView
//
//  Created by Tintash on 21/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("I am initializing a cell for reuse")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("I am initializing a cell coder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("awake from nib")
    }
    
}
