//
//  LottieView.swift
//  LottieDemo
//
//  Created by Jiang, John X. -ND on 12/2/21.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode
    
    var animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let container = UIView()
        animationView.animation = .named(name)
        animationView.loopMode = loopMode
        animationView.play()
        container.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: container.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            animationView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            animationView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        return container
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
