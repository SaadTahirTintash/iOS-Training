import UIKit

protocol Test{
    func test1()
}

extension Test{
    func test1(){
        print("HEY!")
    }
}

protocol Test2{
    func test1()
}

extension Test2{
    func test1(){
        print("Another HEY!")
    }
}

protocol Bird: CustomStringConvertible{
    var name : String{get}
    var canFly : Bool{get}
}

extension Bird{
    var canFly: Bool {return self is Flyable}
}

extension CustomStringConvertible where Self: Bird{
    var description: String{
        return canFly ? "I can Fly" : "Can;t fly"
    }
}

protocol Flyable{
    var airSpeedVelocity: Double {get}
}

struct FlappyBird: Bird, Flyable{
    let name: String
    let canFly: Bool
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airSpeedVelocity: Double{
        return 3 * flappyAmplitude * flappyFrequency
    }
}

struct Penguin: Bird{
    let name: String
    let canFly: Bool
}

struct SwiftBird: Bird, Flyable{
    var name: String{ return "Swift \(version)"}
    let version: Double
    let canFly: Bool
    
    var airSpeedVelocity: Double{return 1000.0 * version}
}



protocol FullyNamed{
    var fullname: String {get}
}

protocol FullyNamed2{
    var fullname: String{get set}
}

struct Detective: FullyNamed{
    var fullname: String
}

struct General: FullyNamed{
    fileprivate var name: String
    var fullname: String{
        return name
    }
}

struct Soldier: FullyNamed2{
    var fullname: String
}

//Gettable: Constant property
var detective = Detective(fullname: "John Legend")
print(detective.fullname)

//Gettable: Variable property
var detective2 = Detective(fullname: "Another John Legend")
print(detective2.fullname)
detective2.fullname = "Changed Name"
print(detective2.fullname)

//Gettable: Computed property
var general = General(name: "Raheel")
print(general.fullname)

//Get Set: Constant property
var solder = Soldier(fullname: "Soldier")


let numbers = [1,2,3,4,5,6]
let slice = numbers[1...3]
let reverseSlice = slice.reversed()


class Motorcycle{
    var name: String
    var speed: Double
    init(name: String) {
        self.name = name
        speed = 200
    }
}

protocol Racer{
    var speed: Double{get}
}

extension FlappyBird: Racer{
    var speed: Double{
        return airSpeedVelocity
    }
}

extension SwiftBird: Racer{
    var speed: Double{
        return airSpeedVelocity
    }
}

extension Penguin: Racer{
    var speed: Double{
        return 48
    }
}

extension Motorcycle: Racer{}

let racers : [Racer] = [Penguin.init(name: "Peng", canFly: false),
                        SwiftBird(version: 20.0, canFly: false),
                        FlappyBird.init(name: "Flapp", canFly: true, flappyAmplitude: 10, flappyFrequency: 10),
                        Motorcycle.init(name: "Motorola")]

extension Sequence where Iterator.Element == Racer{
    func topSpeed() -> Double{
        return self.max(by: {$0.speed < $1.speed})?.speed ?? 0
    }
}

racers.topSpeed()
racers[2...3].topSpeed()
