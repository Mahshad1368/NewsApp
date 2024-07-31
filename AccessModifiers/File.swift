//
//  File.swift
//  AccessModifiers
//
//  Created by Mahshad Jafari on 11.06.24.
//

import Foundation

class Vehicle{
    
   fileprivate var marke = "Audi"
    var ps = 200
}

class Car : Vehicle{
    
    func myMethod(){
        print(ps, marke)
    }
}

class Bike : Vehicle{
    
    func myMethode(){
        
        print(ps, marke)
    }
}

