import SwiftUI

struct ContentView: View {
    @ObservedObject var netMan = NetManager()
    
    var body: some View {
        NavigationView {
            List(netMan.posts) { (p) in
                NavigationLink(destination: DetailView(url: p.url)) {
                    HStack {
                        Text(String(p.points))
                        Text(p.title)
                    }
                    
                }
            }
            .navigationBarTitle("h4x0r n3wz")
        }.onAppear {
            netMan.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

