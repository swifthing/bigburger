//
//  ImageView.swift
//  BigBurger
//
//  Created by Anis on 30/07/2022.
//

import SwiftUI

struct ImageView: View {
    var url: URL?
    var width: Int?
    var height: Int?
    var withErrorView: Bool = true
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
                case .empty:
                    LoadingView()
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat(width ?? 60) , height: CGFloat(height ?? 60))
                default:
                    if withErrorView {
                        ErrorView(withSystemImage: "exclamationmark.triangle")
                            .frame(width: CGFloat(width ?? 40) , height: CGFloat(height ?? 40))
                    }
            }
        }
    }
}
