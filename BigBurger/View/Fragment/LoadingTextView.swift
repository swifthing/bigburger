//
//  LoadingTextView.swift
//  BigBurger
//
//  Created by Anis on 30/07/2022.
//

import SwiftUI

struct LoadingView: View {
    var withText: String?
    var withLoader: Bool = true
    var body: some View {
        if withLoader {
            ProgressView()
        }
        if let text = withText {
            Text(text)
        }
    }
}
