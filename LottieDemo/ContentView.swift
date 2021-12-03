//
//  ContentView.swift
//  LottieDemo
//
//  Created by Jiang, John X. -ND on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = false
    var body: some View {
        VStack {
            LottieView(name: "lottie-demo-welcome", loopMode: .loop)
            Spacer()
            Button("Open Download Page") {
                self.isPresenting.toggle()
            }
            .padding(.horizontal, 40.0)
            .padding(.vertical, 20.0)
            .sheet(isPresented: $isPresenting) {
                DownloadView()
            }
            Spacer()
                .frame(height: 60.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
