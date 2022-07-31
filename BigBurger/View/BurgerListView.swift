//
//  BurgerListView.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: BurgerListViewModel = BurgerListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let burgers = viewModel.data {
                    if burgers.isEmpty {
                        ErrorView(
                            withSystemImage: "exclamationmark.triangle",
                            withText: "Une erreur s'est produite. Veuillez recharger la page."
                        )
                    } else {
                        BurgerListHomeView(burgers: burgers)
                    }
                } else {
                    LoadingView(withText: "Chargement en cours ...")
                }
            }
            .navigationTitle("Big Burger")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.refresh()
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .tint(.black)
                    }
                }
            }
        }
    }
}

struct BurgerListHomeView: View {

    @EnvironmentObject var cart: CartObject
    var burgers: [BigBurgerModel]

    var body: some View {
        List (burgers, id:\.ref) { burger in
            VStack {
                HStack {
                    VStack {
                        ImageView(url: URL(string: burger.thumbnail), withErrorView: false)
                        if cart.items.contains(burger) {
                            HStack {
                                Image(systemName: "cart.fill")
                                Text("x \(cart.items.filter { $0 == burger }.count)")
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(burger.title)
                            .bold()
                            .font(.system(.title3))
                        Text(burger.description)
                            .italic() 
                            .font(.system(.caption))
                            .lineLimit(2)
                    }
                    Spacer()
                    VStack {
                        Text(burger.euroPrice + " €")
                        Button("") {
                            cart.items.append(burger)
                        }
                    }
                }
            }
        }
    }
}
