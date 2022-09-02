import WebKit
import SwiftUI

struct Webview: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> Webview.UIViewType {
      return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let req = URLRequest(url: url)
                
                uiView.load(req)
            }
        }
    }
}
