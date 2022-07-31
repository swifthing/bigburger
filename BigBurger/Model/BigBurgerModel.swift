//
//  BigBurgerModel.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import Foundation

struct BigBurgerModel: Codable, Equatable, Identifiable {
    var id: UUID { UUID() }
    var ref: String
    var title: String
    var description: String
    var thumbnail: String
    var price: Int
    var euroPrice: String {
        String(format: "%.02f", Double(price) / 100)
    }

    static func == (left: BigBurgerModel, right: BigBurgerModel) -> Bool {
        left.ref == right.ref
    }
}
