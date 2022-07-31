//
//  BigBurgerApp.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import SwiftUI

@main
struct BigBurgerApp: App {

    var cart: CartObject = CartObject()

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView().tag(0).tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Big Burgers")
                            .accentColor(.black)
                    }
                }
                CartView().tag(1).tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Panier")
                            .accentColor(.black)
                    }
                }
            }.environmentObject(cart)
        }
    }
}
