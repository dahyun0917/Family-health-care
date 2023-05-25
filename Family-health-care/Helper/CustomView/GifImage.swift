//
//  GifImage.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//
//
import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    @Binding var name: String
    
    init(_ name: Binding<String>) {
        self._name = name
    }
    
    //    func makeUIView(context: Context) -> WKWebView {
    //        let webView = WKWebView()
    //        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
    //        let data = try! Data(contentsOf: url)
    //        webView.isOpaque=false
    //        webView.backgroundColor=UIColor.clear
    //        webView.load(
    //            data,
    //            mimeType: "image/gif",
    //            characterEncodingName: "UTF-8",
    //            baseURL: url.deletingLastPathComponent()
    //        )
    ////        print("\(webView.scrollView.contentSize)")
    //        webView.scrollView.isScrollEnabled = false
    //        return webView
    //    }
    //
    //    func updateUIView(_ uiView: WKWebView, context: Context) {
    //        uiView.reload()
    //    }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        loadGif(webView)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        loadGif(uiView)
    }
    
//    private func loadGif(_ webView: WKWebView) {
//        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
//        let data = try! Data(contentsOf: url)
//        webView.isOpaque = false
//        webView.backgroundColor = UIColor.clear
//        webView.load(
//            data,
//            mimeType: "image/gif",
//            characterEncodingName: "UTF-8",
//            baseURL: url.deletingLastPathComponent()
//        )
//        webView.scrollView.isScrollEnabled = false
//    }
    private func loadGif(_ webView: WKWebView) {
            guard let url = Bundle.main.url(forResource: name, withExtension: "gif"),
                  let data = try? Data(contentsOf: url) else {
                // log error or handle failure
                print("Error: Failed to load gif \(name)")
                return
            }
            
            let base64Data = data.base64EncodedString()
        let htmlString = """
        <html style="height:100%; width:100%; overflow:hidden; display:flex; align-items:center; justify-content:center; background:transparent;">
        <body style="margin:0; padding:0; display:flex; align-items:center; justify-content:center; width:100%; height:100%;">
        <img src="data:image/gif;base64,\(base64Data)" style="object-fit:contain; max-width:100%; max-height:100%;">
        </body>
        </html>
        """

            
            webView.isOpaque = false
            webView.backgroundColor = UIColor.clear
            webView.scrollView.isScrollEnabled = false
            webView.loadHTMLString(htmlString, baseURL: nil)
        }
}




//struct GifImage_Previews: PreviewProvider {
//    @State private var gifName: String = "temp"
//    static var previews: some View {
//
//            
//            GifImage($gifName).border(Color.black)
//            
//        
//    }
//}

struct CContentView: View {
    @State private var gifName: String = "temp"
    
    var body: some View {
        GifImage($gifName).border(Color.black)
    }
}

struct CContentView_Previews: PreviewProvider {
    static var previews: some View {
        CContentView()
    }
}
