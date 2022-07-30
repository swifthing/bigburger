//
//  BurgerListView.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import SwiftUI

struct BurgerListView: View {

    @ObservedObject var viewModel: BurgerListViewModel = BurgerListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let burgers = viewModel.data {
                    if burgers.isEmpty {
                        Text("Une erreur s'est produite. Veuillez recharger la page.")
                    } else {
                        List (burgers, id:\.ref) { burger in
                            HStack {
                                VStack {
                                    Text(burger.title)
                                        .bold()
                                    Text(burger.description)
                                        .italic()
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                }
                                Spacer()
                                AsyncImage(url: URL(string: burger.thumbnail)) { phase in
                                    switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .clipShape(Circle())
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                        default:
                                            Image(systemName: "exclamationmark.triangle")
                                                .clipShape(Circle())
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Text("Chargement en cours ...")
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
