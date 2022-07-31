//
//  ErrorView.swift
//  BigBurger
//
//  Created by Anis on 30/07/2022.
//

import SwiftUI

struct ErrorView: View {
    var withImage: String?
    var withSystemImage: String?
    var withText: String?
    var body: some View {
        if let image = withImage {
            Image(image)
        }
        if let systemImage = withSystemImage {
            Image(systemName: systemImage)
        }
        if let text = withText {
            Text(text)
                .multilineTextAlignment(.center)
        }
    }
}
