//
//  PetViewModel.swift
//  MVVM
//
//  Created by Tintash on 15/07/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

struct PetViewModel {
    private let pet: PetModel
    private let calendar: Calendar
    
    init(pet: PetModel) {
        self.pet = pet
        self.calendar = Calendar(identifier: .gregorian)
    }
    
    var name: String{
        return pet.name
    }
    
    var image: UIImage{
        return pet.image
    }
    
    var ageText: String{
        let today = calendar.startOfDay(for: Date())
        let birthday = calendar.startOfDay(for: pet.birthday)
        let components = calendar.dateComponents([.year],
                                                 from: birthday,
                                                 to: today)
        let age = components.year!
        return "\(age) years old"
    }
    
    var adoptionFeeText: String{
        switch pet.rarity {
        case .common:
            return "$50.00"
        case .uncommon:
            return "$100.00"
        case .rare:
            return "$150.00"
        case .veryRare:
            return "$200.00"
        }
    }
}
