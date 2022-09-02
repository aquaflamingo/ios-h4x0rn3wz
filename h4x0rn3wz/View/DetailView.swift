import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        Webview(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}

     
