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
                if viewModel.data.isEmpty {
                    Text("Chargement en cours ...")
                } else {
                    List (viewModel.data, id:\.ref) { burger in
                        HStack {
                            Text(burger.title)
                                .bold()
                            Spacer()
                            AsyncImage(
                                url: URL(string: burger.thumbnail),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 60, maxHeight: 60)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                    }
                }
            }.navigationTitle("Big Burger")
        }
    }
}
