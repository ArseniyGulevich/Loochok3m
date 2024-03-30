import Foundation

class API: NSObject {
    static func loadData(url: String, completion: @escaping (RegLogResponseM) -> ()) {
        guard let url = URL(string: url) else {
            print("Incorrect url.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let regLogResponse = try JSONDecoder().decode(RegLogResponseM.self, from: data!)
                DispatchQueue.main.async {
                    completion(regLogResponse)
                }
            } catch {
                print("Decoding error.")
            }
        }
        .resume()
    }
}
