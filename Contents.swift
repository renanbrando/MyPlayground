//: Playground - noun: a place where people can play

import UIKit

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

