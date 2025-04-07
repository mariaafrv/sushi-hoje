import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
  let gifName: String
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.scrollView.isScrollEnabled = false
    webView.backgroundColor = .clear
    webView.isOpaque = false
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
      let data = try? Data(contentsOf: URL(fileURLWithPath: path))
      let baseURL = URL(fileURLWithPath: path)
      uiView.load(data!,
                  mimeType: "image/gif",
                  characterEncodingName: "",
                  baseURL: baseURL)
    }
  }
}
