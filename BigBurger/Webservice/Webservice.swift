//
//  Webservice.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import Foundation
import Combine

class Webservice<T: Codable>: ObservableObject {

    @Published var data: T?
    var cancellable: AnyCancellable?
    var request: URLRequest

    init (_ request: URLRequest) {
        self.request = request
        fetch()
    }

    func fetch () {
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map {$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .sink { completed in
                switch completed {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: { [weak self] value in
                self?.data = value
            }
    }
}
