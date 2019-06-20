//
//  ViewController.swift
//  CollectionViewSelfSizing
//
//  Created by Vadym Bulavin on 1/31/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!{
        didSet{
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    
    
    let items: [Item] = [
        Item(title: "Lorem ipsum dolor sit amet, consectetur"),
        Item(title: "adipiscing elit, sed do eiusmod tempor"),
        Item(title: "incididunt ut labore et dolore magna aliqua"),
        Item(title: "Ut enim ad minim veniam"),
        Item(title: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Item(title: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ]
    
    let names: [Name] = [
        Name(name: "ABC"),
        Name(name: "BCD"),
        Name(name: "EFD"),
        Name(name: "LWO"),
        Name(name: "FGR"),
        Name(name: "WEFS")
    ]
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.titleLabel.text = items[indexPath.row].title
        cell.nameLabel.text = names[indexPath.row].name
        cell.uiImage.backgroundColor = .gray
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.maxWidth = collectionView.bounds.width - 16
        return cell
    }
    
    
}
