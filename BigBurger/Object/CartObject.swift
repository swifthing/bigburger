//
//  CartObject.swift
//  BigBurger
//
//  Created by Anis on 31/07/2022.
//

import Foundation
import Combine

class CartObject: ObservableObject {
    @Published var items: [BigBurgerModel] = []
    @Published var totalPrice: Double = 0
    private var cancellable: AnyCancellable?

    init () {
        cancellable = $items
            .sink { [weak self] value in
                self?.totalPrice = value
                    .map { Double($0.price) }
                    .reduce(0, +)
            }
    }
}
