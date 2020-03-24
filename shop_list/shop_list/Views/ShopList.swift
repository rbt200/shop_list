//
//  ShopList.swift
//  shop_list
//
//  Created by Ivan Ivanov on 24.03.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct ShopList: View {
    var availableItems: [ShopItem]
    @State private var cartItems: Dictionary<Int, ShopItem> = [:]
    var body: some View {
        NavigationView {
            List(availableItems) { item in
                ShopRow(inCart: self.inCart(shopItem: item), shopItem: item).onTapGesture {
                    self.toggleCartItem(shopItem: item)
                }
            }
            .navigationBarTitle(Text("Nike shop"))
            .navigationBarItems(trailing: Cart())
            
        }
    }
    
    private func inCart(shopItem: ShopItem) -> Bool {
        return cartItems[shopItem.id] != nil
    }
    
    private func toggleCartItem(shopItem: ShopItem) {
        if cartItems[shopItem.id] == nil {
            cartItems[shopItem.id] = shopItem
        } else {
            cartItems[shopItem.id] = nil
        }
    }
}

struct Cart: View {
    var body: some View {
        Image("cart")
        .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(maxWidth: 50)
    }
}

struct ShopRow: View {
    var inCart: Bool
    var shopItem: ShopItem
    var body: some View {
        HStack {
            Text(shopItem.name)
            Text("$\(String(format: "%.2f", shopItem.price))")
                .fontWeight(.bold)
            Spacer()
            Image(inCart ? "checked" : "unchecked")
            .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 50)
        }
    }
}

struct ShopList_Previews: PreviewProvider {
    static var previews: some View {
        ShopList(availableItems: [
            ShopItem(price: 99.99, id: 1, name: "Nike Air"),
            ShopItem(price: 83.99, id: 2, name: "Nike Booster"),
            ShopItem(price: 76.99, id: 3, name: "Nike Jordan"),
            ShopItem(price: 109.99, id: 4, name: "Nike Walker"),
        ])
    }
}
