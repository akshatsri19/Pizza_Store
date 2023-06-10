import SwiftUI

struct ReceiptView: View {
    
    @EnvironmentObject var orderedPizza:OrderedPizza
    @State private var subTotal:Double = 0.0
    @State private var tax:Double = 0.0
    @State private var total:Double = 0.0
    
    var body: some View {
        VStack(alignment: .center){
            List{
                Section{
                    Text("Customer Name: \(orderedPizza.custName)")
                    Text("Customer Number: \(orderedPizza.custPhoneNo)")
                    if(orderedPizza.pizzaChoice){
                        Text("Pizza Choice: Non-Veg")
                    }else{
                        Text("Pizza Choice: Veg")
                    }
                    Text("Pizza Size: \(orderedPizza.pizzaSize)")
                    Text("Pizza Quantity: \(orderedPizza.pizzaQty)")
                    if(self.orderedPizza.coupunApplied){
                        Text("Discount Coupon Applied 🥳")
                    }else{
                        Text("No Discount Coupon Applied 🙁")
                    }
                }
                
                Text("Subtotal: $\(String(format:"%.2f",self.subTotal))")
                Text("Tax: $\(String(format:"%.2f",self.tax))")
                Text("Total: $\(String(format:"%.2f",self.total))")
            }
            Button{
                self.totalPrice()
            }label: {
                Text("Calculate Price")
            }.buttonStyle(.borderedProminent)
        }
        .navigationTitle("Your receipt")
    }
    
    private func totalPrice(){
        
        if(self.orderedPizza.coupunApplied){
            self.subTotal = 5.00 * Double(self.orderedPizza.pizzaQty)
        }else{
            if(self.orderedPizza.pizzaChoice == true){
                if(self.orderedPizza.pizzaSize == "small"){
                    self.subTotal = 6.99
                }else if(self.orderedPizza.pizzaSize == "medium"){
                    self.subTotal = 8.99
                }else{
                    self.subTotal = 12.99
                }
            }else{
                if(self.orderedPizza.pizzaSize == "small"){
                    self.subTotal = 5.99
                }else if(self.orderedPizza.pizzaSize == "medium"){
                    self.subTotal = 7.99
                }else{
                    self.subTotal = 10.99
                }
            }
        }
        self.tax = (subTotal * Double(self.orderedPizza.pizzaQty)) * 0.13
        self.total = self.subTotal + self.tax
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}
