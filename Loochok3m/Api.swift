//  Created by Арсений Гулевич  on 09.03.2024.
//

import Foundation

class Api: ObservableObject {
    @Published var games =  [Game]()
    
    init() {
        
    }
    
    func loadData(url: String, completion: @escaping (([Game]) -> ())) {
        
        guard let url = URL(string: url) else {
            print("The url was invalid")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let games = try! JSONDecoder().decode([Game].self, from: data!)
            
            DispatchQueue.main.async {
                completion(games)
            }
        }
        .resume()
    }
}
