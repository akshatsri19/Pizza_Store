//
//  OrderedPizza.swift
//  Akshat_Pizza
//
//  Created by Akshat Srivastava on 2023-06-05.
//

import Foundation

class OrderedPizza:ObservableObject{
    
    var custName:String
    var custPhoneNo:String
    var pizzaSize:String
    var pizzaChoice:Bool
    var pizzaQty:Int
    var coupunApplied:Bool
    
    init(){
        self.custName = ""
        self.custPhoneNo = ""
        self.pizzaSize = ""
        self.pizzaChoice = true
        self.pizzaQty = 1
        self.coupunApplied = false
        
    }
    
    init(custName: String, custPhoneNo: String, pizzaSize: String, pizzaChoice: Bool, pizzaQty: Int, coupunApplied: Bool) {
        self.custName = custName
        self.custPhoneNo = custPhoneNo
        self.pizzaSize = pizzaSize
        self.pizzaChoice = pizzaChoice
        self.pizzaQty = pizzaQty
        self.coupunApplied = coupunApplied
    }
}
