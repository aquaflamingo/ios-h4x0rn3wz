import Foundation

class NetManager: ObservableObject {
    let frontPageItems = "https://hn.algolia.com/api/v1/search?tags=front_page"
 
    @Published var posts = [Post]()
    
    func fetch() {
        if let url = URL(string: frontPageItems) {
            let s = URLSession(configuration: .default)
            let t = s.dataTask(with: url) { (data, res, error) in
                if error == nil {
                  let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let res = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = res.hits
                            }
                        } catch {
                            print("ERROR \(error)")
                        }
                    }
                }
            }
            
            t.resume()
        }
    }
}

