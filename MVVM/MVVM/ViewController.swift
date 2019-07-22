//
//  ViewController.swift
//  MVVM
//
//  Created by Tintash on 15/07/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petPrice: UILabel!
    @IBOutlet weak var petAge: UILabel!
    
    let birthday = Date(timeIntervalSinceNow: (-2 * 86400 * 366))
    let animalImage = #imageLiteral(resourceName: "animal")
    let animalName = "Animal"
    let rarity = Rarity.rare
    var petViewModel: PetViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        let pet = PetModel(name: animalName, birthday: birthday, rarity: rarity, image: animalImage)
        petViewModel = PetViewModel(pet: pet)
        
        petImage.image = petViewModel?.image
        petPrice.text = petViewModel?.adoptionFeeText
        petName.text = petViewModel?.name
        petAge.text = petViewModel?.ageText
        
    }


}

