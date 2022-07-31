//
//  CartView.swift
//  BigBurger
//
//  Created by Anis on 30/07/2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartObject
    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    VStack {
                        Image(systemName: "cart.circle")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text("Panier vide")
                            .font(.body)
                    }
                } else {
                    VStack {
                        Text("Total panier: ")
                            .foregroundColor(.gray)
                        HStack {
                            Text(String(format: "%.02f", cart.totalPrice / 100))
                                .font(.largeTitle)
                                .bold()
                            Text("€")
                                .font(.footnote)
                        }
                    }
                    List(cart.items, id:\.id) { item in
                        Text(item.title)
                            .swipeActions {
                                Button("Retirer") {
                                    if let index = cart.items.firstIndex(of: item) {
                                        cart.items.remove(at: index)
                                    }
                                }.tint(.red)
                            }
                    }
                }
            }
        }
    }
}
