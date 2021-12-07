//
//  DownloadView.swift
//  LottieDemo
//
//  Created by Jiang, John X. -ND on 12/2/21.
//

import SwiftUI
import Lottie

struct DownloadView: View {
    
    @StateObject var viewModel = DemoViewModel()
    
    @State var inProgress: Bool = false
    
    var body: some View {
        VStack {
            InteractiveLottieView(name: "lottie-demo-progress", range: ProgressKeyFrames.start.rawValue...ProgressKeyFrames.end.rawValue, progress: $viewModel.progress, complete: $viewModel.completed)
            Spacer()
            Button("Start Downloading") {
                inProgress.toggle()
                viewModel.download(urlString: "http://cachefly.cachefly.net/100mb.test")
            }
            .padding(.horizontal, 40.0)
            .padding(.vertical, 20.0)
            .disabled(inProgress)
            Spacer()
                .frame(height: 60.0)
        }
    }
    
    enum ProgressKeyFrames: AnimationFrameTime {
        case start = 0
        case end = 180
        case complete = 241
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
    }
}
