//
//  ContentView.swift
//  WebApp
//
//  Created by Usman Tahir Qureshi on 2/8/23.
//

import SwiftUI

struct MyView: UIViewControllerRepresentable {
    typealias UIViewControllerType = WebUIController
    
    
    
    func makeUIViewController(context: Context) -> WebUIController {
        let vc = WebUIController()
        // Do some configurations here if needed.
        return vc
    }
    
    func updateUIViewController(_ uiViewController: WebUIController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
    
    
}
