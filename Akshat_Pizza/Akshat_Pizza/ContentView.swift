import SwiftUI

struct ContentView: View {
    
    @State private var pizzaChoice:Bool = true
    @State private var selectedSize:String = "medium"
    @State private var quantity:Int = 1
    @State private var custNumberFromUI:String = ""
    @State private var custNameFromUI:String = ""
    @State private var coupanCodeFromUI:String = ""
    @State private var liskSelection : Int? = nil
    @State private var errorMsg: String? = nil
    @State private var coupounApplied:Bool = false
    
    var orderedPizza:OrderedPizza = OrderedPizza()
    
    var body: some View {
        NavigationView{
            
            VStack(alignment:.center,spacing: 20){
                
                NavigationLink(destination:ReceiptView().environmentObject(self.orderedPizza), tag: 1, selection: $liskSelection){}
                
                List{
                    Section{
                        Image("Peppy_Paneer")
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Toggle("Pizza Choice", isOn: $pizzaChoice)
                            .toggleStyle(SwitchToggleStyle(tint: Color.red))
                        if(pizzaChoice == true){
                            Text("Non-Veg Pizza")
                        }else{
                            Text("Veg Pizza")
                        }
                        Text("Select a size")
                        Picker("",selection: $selectedSize){
                            Text("Small").tag("small")
                            Text("Medium").tag("medium")
                            Text("Large").tag("large")
                        }
                        .pickerStyle(.segmented)
                        Stepper("Quantity", value:$quantity,in:1...5)
                        Text("Selected Quantity: \(quantity)")
                    } header: {
                        Text("Create your own Pizza")
                    } footer: {
                        if let errMsg = errorMsg {
                            Text(errMsg)
                                .font(.system(size: 15))
                                .foregroundColor(Color.red)
                        }
                    }
                    Section{
                        Text("Enter your Name")
                        TextField("Example Akshat", text: $custNameFromUI)
                            .keyboardType(.default)
                        Text("Mobile Numnber")
                        TextField("Example 2896230427", text: $custNumberFromUI)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Details")
                    }
                    Section{
                        Text("Coupan Code")
                        TextField("Example WED50", text:$coupanCodeFromUI)
                            .keyboardType(.default)
                    } header: {
                        Text("Apply for Discount")
                    }
                }
                
                

                Button{
                    if(custNumberFromUI.isEmpty){
                        self.errorMsg = "ERROR: Please enter the mobile number to proceed"
                       return
                    }
                    if(coupanCodeFromUI.lowercased().hasPrefix("offer")){
                        self.coupounApplied = true
                    }else if(coupanCodeFromUI.isEmpty){
                        self.liskSelection = 1
                    }
                    else{
                        coupanCodeFromUI = ""
                        self.errorMsg = "ERROR: Please enter a valid coupan code..!!"
                        self.coupounApplied = false
                        return
                    }
                    
                    self.orderedPizza.custName = custNameFromUI
                    self.orderedPizza.custPhoneNo = custNumberFromUI
                    self.orderedPizza.pizzaChoice = pizzaChoice
                    self.orderedPizza.pizzaQty = quantity
                    self.orderedPizza.pizzaSize = selectedSize
                    self.orderedPizza.coupunApplied = coupounApplied
                    
                    self.liskSelection = 1
                    self.errorMsg = ""
                }label: {
                    Text("Place Order")
                }.buttonStyle(.borderedProminent)
                    .navigationTitle("Akshat_Pizza")
                                    
            }
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Menu{
                        Button{
                            self.pizzaChoice = true
                            self.selectedSize = "large"
                            self.quantity = 2
                            self.coupounApplied = false
                        }label: {
                            Text("Daily Special")
                        }
                        Button{
                            self.pizzaChoice = true
                            self.selectedSize = "medium"
                            self.quantity = 1
                            self.errorMsg = ""
                        }label: {
                            Text("Reset")
                        }
                    }label: {
                        Image(systemName: "list.dash")
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
