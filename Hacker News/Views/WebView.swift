//
//  WebView.swift
//  Hacker News
//
//  Created by Mikail on 16/01/2022.
//
import SwiftUI
import Foundation
import WebKit

struct WebView: UIViewRepresentable{
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
               
        }
    }
}
