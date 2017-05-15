//
//  currencyData.swift
//  currencyConverter
//
//  Created by Joshua Marvel on 5/14/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//


import UIKit

class currencyData {
    var home:String = ""
    var foreign:String = ""
   
    var amount:Float = 0
   
    var rate:Float = 1
    var converted:Float = 0
    
    
   
    var pickerArray = [String]()
    
    
   
    
    
    
    private init(_ home:String = "", _ foreign:String = "", _ amount:Float = 0, _ rate:Float = 0, _ converted:Float = 0, _ pickerArray:String = ""){
        self.home = home
        self.foreign = foreign
        self.amount = amount
        self.rate = rate
        self.converted = converted
        self.pickerArray = ["US Dollar", "Japanese Yen","British Pound", "Australian Dollar", "Indian Rupee", "Euro"]
        getSetRate(0)
    }
    
    
    
    func getSetRate(_ num: Float)->Void{
        let getRate:Float = num
        self.rate = getRate
    }
    
    
    
    static let shared:currencyData = currencyData()
}
