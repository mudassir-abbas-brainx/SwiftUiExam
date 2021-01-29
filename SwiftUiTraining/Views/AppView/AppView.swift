//
//  AppView.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 28/01/2021.
//

import SwiftUI

struct AppView: View {
    
    //MARK:- PROPERTIES
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            FavouriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    //MARK:- PROPERTIES
    static var previews: some View {
        AppView()
    }
}
