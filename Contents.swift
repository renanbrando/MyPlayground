//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Error handling
enum AccessError : Error {
    case wrongPassword
    case wrongLogin
    case wrongData
}


func login(userName: String, password:String ) -> String {
    let validUser = "alunofiap"
    let validPassword = "123456"
    
    if userName == validUser && password == validPassword{
        return "User logged successfully"
    }
    else{
        return "Login failed"
    }
}


let result = login(userName: "renan", password: "123456")

func loginUser(userName: String, password:String ) throws -> String {
    let validUser = "alunofiap"
    let validPassword = "123456"
    
    if userName != validUser && password != validPassword{
        throw AccessError.wrongData
    } else if userName != validUser {
        throw AccessError.wrongLogin
    } else if password != validPassword {
        throw AccessError.wrongPassword
    } else {
        return "User logged successfully"
    }
}


do {
    let res = try loginUser(userName: "renan", password: "123456")
} catch AccessError.wrongData {
    print("Wrong password and user")
} catch AccessError.wrongLogin {
    print("Wrong username")
} catch AccessError.wrongPassword {
    print("Wrong password")
} catch {
    print("Unknown error")
}


do {
    let res = try loginUser(userName: "renan", password: "123456")
} catch {
    switch error as! AccessError {
    case .wrongData:
        print("Wrong password and user")
    case .wrongLogin:
        print("Wrong username")
    case .wrongPassword:
        print("Wrong password")
    default:
        print("Unknown error")
    }
}


let array = ["Eric", "Brito"]

func swapInts(a: inout Int, b: inout Int){
    let temp = a
    a = b
    b = temp
}


var x = 10
var y = 20
swapInts(a: &x, b: &y)
print(x,y)

func swapValues<J>(a: inout J, b: inout J){
    
    let temp = a
    a = b
    b = temp
}


var z = "Me"
var w = "You"

swapValues(a: &z, b: &w)
print(z, w)

class Vehicle {
    
    private var _speed: UInt = 0
    var model: String
    var speed: UInt {
        get {return _speed}
        set {
            let finalSpeed = min(maxSpeed, newValue)
            _speed = finalSpeed
        }
    }
    
    static let speedUnit = "km/h"
    
    var maxSpeed: UInt {
        return 250
    }
    
    init(model: String){
        self.model = model
    }
    
    func descript() -> String {
        return "Vehicle: \(model), speed: \(speed)"
    }
    
    class func alert() {
        print("If you drink, you can drive but I will not join you!")
    }
}

print("The unity utilized in Vehicle is \(Vehicle.speedUnit)")
var vehicle = Vehicle(model: "Ferrari")
vehicle.speed = 600
print(vehicle.speed)
vehicle.descript()

Vehicle.alert()


class Car: Vehicle {
    var licencePlate: String
    var driver: String?
    
    subscript(index: Int) -> String {
        get {
            let plateArray = Array(self.licencePlate.characters)
            return String(plateArray[index])
        }
        set{
            var plateArray = Array(self.licencePlate.characters)
            plateArray[index] = Character(newValue)
            self.licencePlate = String(plateArray)
        }
    }
    
    override var maxSpeed: UInt {
        return 150
    }
    
    init(model: String, licensePlate: String){
        self.licencePlate = licensePlate
        super.init(model: model)
    }
    
    convenience init(driver: String) {
        self.init(model: "", licensePlate: "")
        self.driver = driver
        
    }
    
    override func descript() -> String {
        return "\(super.descript()), \(licencePlate)"
    }
}

var car = Car(model: "Fusca", licensePlate: "AMP7541")
car[6] = "5"
print(car.licencePlate)


if car[6] == "1" || car[6] == "2" {
    print("Only after 8pm")
}

var name: String = "Renan Ribeiro Brando"

extension String{
    var count: Int {
        return self.characters.count
    }
    
    func initials() -> String {
        return self.components(separatedBy: " ").map({String($0.characters.first!)}).joined()
    }
}

print("My name has \(name.count) letters")
print("My initial are \(name.initials())")
