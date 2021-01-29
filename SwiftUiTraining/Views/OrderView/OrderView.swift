//
//  OrderView.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 28/01/2021.
//

import SwiftUI

struct OrderView: View {
    
    //MARK:- PROPERTIES
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        deleteItem(at: indexSet)
                    })
                }
                
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }.disabled(order.items.isEmpty)
                }
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    //MARK:- DELETE AT SPECIFIC INDEX FUNCTION
    func deleteItem(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            OrderView().environmentObject(order)
        }
    }
}
