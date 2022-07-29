//
//  BurgerListViewModel.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import Foundation
import Combine

class BurgerListViewModel: ObservableObject {
    @Published var data: [BigBurgerModel] = []
    var webservice: Webservice<[BigBurgerModel]>
    var cancellable: AnyCancellable?

    init () {
        let request = WSEndpoint.burgerList.request
        webservice = Webservice(request)
        cancellable = webservice.$data
            .sink { [weak self] model in
                if let model = model {
                    self?.data = model
                }
            }
    }
}
