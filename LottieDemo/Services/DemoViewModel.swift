//
//  DemoViewModel.swift
//  LottieDemo
//
//  Created by Jiang, John X. -ND on 12/2/21.
//

import Foundation
import SwiftUI

class DemoViewModel: NSObject, ObservableObject {
    
    @Published var progress: CGFloat = 0
    @Published var completed: Bool = false
    
    func download(urlString: String) {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .init())
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL string.")
        }
        let task = session.downloadTask(with: url)
        task.resume()
    }
}

extension DemoViewModel: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.progress = percentage
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async {
            self.completed = true
        }
    }
}
