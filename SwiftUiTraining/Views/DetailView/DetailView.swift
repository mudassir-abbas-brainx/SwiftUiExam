//
//  DetailView.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 28/01/2021.
//

import SwiftUI

struct DetailView: View {
    
    //MARK:- PROPERTIES
    var item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing, content: {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            })
            
            Text(item.description)
                .padding()
            
            Button(action: {
                self.order.add(item: self.item)
            }, label: {
                Text("Order This")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(15)
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
                    .padding(10)
                    
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.purple, lineWidth: 5))
                    
            })
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            DetailView(item: MenuItem.example).environmentObject(order)
        }
    }
}
