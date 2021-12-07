//
//  InteractiveLottieView.swift
//  LottieDemo
//
//  Created by Jiang, John X. -ND on 12/2/21.
//

import SwiftUI
import Lottie

struct InteractiveLottieView: UIViewRepresentable {
    
    var name: String
    var range: ClosedRange<AnimationFrameTime>
    
    @Binding var progress: CGFloat?
    @Binding var complete: Bool
    
    let animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    func makeUIView(context: UIViewRepresentableContext<InteractiveLottieView>) -> UIView {
        let container = UIView()
        animationView.animation = .named(name)
        container.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: container.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            animationView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            animationView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        return container
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<InteractiveLottieView>) {
        guard let progress = progress else {
            return
        }
        let animationView = context.coordinator.parent.animationView
        animationView.currentFrame = progress * range.lowerBound.distance(to: range.upperBound) + range.lowerBound
        if complete {
            animationView.play()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        .init(parent: self)
    }
    
    struct Coordinator {
        var parent: InteractiveLottieView
        
        init(parent: InteractiveLottieView) {
            self.parent = parent
        }
    }
}
