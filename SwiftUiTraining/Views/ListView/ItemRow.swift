//
//  ItemRow.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 28/01/2021.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        NavigationLink(destination: DetailView(item: item)) {
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading, spacing: nil, content: {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                })
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction,default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
