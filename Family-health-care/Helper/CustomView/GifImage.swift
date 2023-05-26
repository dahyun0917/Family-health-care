//
//  GifImage.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//
//

import SwiftUI
import SwiftyGif

struct GifView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let gif = try! UIImage(gifName: gifName)
        let imageView = UIImageView(gifImage: gif, loopCount: -1) // Loop forever
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
