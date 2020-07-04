//
//  DetailView.swift
//  WhatsNews-ID
//
//  Created by Felinda Gracia Lubis on 7/5/20.
//  Copyright © 2020 Felinda Lubis. All rights reserved.
//

import SwiftUI
import WebKit


struct DetailView: View {
    
    let url : String
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}

struct WebView : UIViewRepresentable {
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let safeURL = URL(string: safeString) {
                let request = URLRequest(url: safeURL)
                uiView.load(request)
            }
        }
    }
}
