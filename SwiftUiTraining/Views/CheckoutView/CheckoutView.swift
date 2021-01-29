//
//  CheckoutView.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 29/01/2021.
//

import SwiftUI

struct CheckoutView: View {
    //MARK:- PROPERTIES
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addloyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    static let paymentTypes = ["Cash","Credit Card", "iDine Points"]
    static let tipAmounts = [10,15,20,25,0]
    
    var totalPrice: Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    //MARK:- BODY
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addloyaltyDetails.animation(), label: {
                    Text("Add iDine loyalty card")
                })
                
                if addloyaltyDetails{
                    TextField("Enter you iDine ID", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)) {
                Button(action: {
                    self.showingPaymentAlert.toggle()
                }, label: {
                    Text("Confirm Order")
                        .fontWeight(.bold)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                        .padding(10)
                    
                })
            }
            
            .alert(isPresented: $showingPaymentAlert, content: {
                Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice,specifier: "%.2f")"), dismissButton: .default(Text("OK")))
            })
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    //MARK:- PROPERTIES
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
