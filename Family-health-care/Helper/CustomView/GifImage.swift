//
//  GifImage.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//
//

import SwiftUI
import SwiftyGif

import SwiftUI
import SwiftyGif

class GifUIImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
}

struct GifView: UIViewRepresentable {
    @Binding var gifName: String

    func makeUIView(context: Context) -> GifUIImageView {
        let gifImageView = GifUIImageView()
        gifImageView.contentMode = .scaleAspectFit
        return gifImageView
    }

    func updateUIView(_ uiView: GifUIImageView, context: Context) {
        do {
            let gif = try UIImage(gifName: gifName)
            uiView.setGifImage(gif)
        } catch {
            print("Failed to load gif: \(error)")
        }
    }
}

