import Foundation

class AuthViewModel: ObservableObject {
    private let successLoginMessage = "You have successfully logged in."
    private let url = "http://127.0.0.1:7000/api/auth/signin"
    private var serverResponse = RegLogResponseM(id: -1, token: "Undefined.")
    
    @Published var showLogin = false
    @Published var showRegister = false
    @Published var showReset = false
    @Published var isSuccessAuth = false
    @Published var errorState: ErrorState = .None
    @Published var loginCounter = 0
    @Published var token = ""
    @Published var data = ""
    @Published var users: [UserM] = []
    
    init() {
        if let token = UserDefaults.standard.string(forKey: "token") {
            self.token = token
            if token.count > 0 { isSuccessAuth = true }
        }
    }
    
    // Password validation function
    private func validatePassword(password: String) -> Bool {
        let control = #"(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&? "])"#
        
        if password.range(of: control, options: .regularExpression) != nil { return true }
        return false
    }
    
    
    // Server signup
    func signupUser(username: String, password: String, email: String, secretResponse: String, completion: @escaping (RegLogResponseM) -> Void) {
        self.token = ""
        let url = URL(string: "http://127.0.0.1:7000/api/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "password": password,
            "email": email,
            "secretResponse": secretResponse
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: "No data received from server"))
                }
                return
            }
            
            do {
                let authResponse = try JSONDecoder().decode(RegLogResponseM.self, from: data)
                if authResponse.id < 0 {
                    DispatchQueue.main.async {
                        self.errorState = .Error(message: authResponse.token)
                    }
                    return
                } else {
                    // token received
                    self.errorState = .Success(message: "Successful authorization.")
                    UserDefaults.standard.setValue(authResponse.token, forKey: "token")
                    self.isSuccessAuth = true
                    self.token = authResponse.token
                }
            } catch {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
            }
        }.resume()
    }
    
    
    // Server login
    func signinUser(username: String, password: String, completion: @escaping (RegLogResponseM) -> Void) {
        self.token = ""
        let url = URL(string: "http://127.0.0.1:7000/api/auth/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: "No data received from server"))
                }
                return
            }
            
            do {
                let authResponse = try JSONDecoder().decode(RegLogResponseM.self, from: data)
                
                if authResponse.id < 0 {
                    DispatchQueue.main.async {
                        self.errorState = .Error(message: authResponse.token)
                    }
                    return
                } else {
                    // token received
                    self.errorState = .Success(message: "Successful authorization.")
                    UserDefaults.standard.setValue(authResponse.token, forKey: "token")
                    self.isSuccessAuth = true
                    self.token = authResponse.token
                    if let token = decode(jwtToken: authResponse.token)["id"] {
                        print("Extracted data from token:")
                        print("User id: \(token)")
                    } else {
                        print("Incorrect token decoding.")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
            }
        }.resume()
    }
    
    
    // Server reset password
    func resetPasswordAPI(username: String, email: String, password: String, secretResponse: String, completion: @escaping (RegLogResponseM) -> Void) {
        self.token = ""
        let url = URL(string: "http://127.0.0.1:7000/api/auth/reset")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "email": email,
            "password": password,
            "secretResponse": secretResponse
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: "No data received from server"))
                }
                return
            }
            
            do {
                let authResponse = try JSONDecoder().decode(RegLogResponseM.self, from: data)
                if authResponse.id < 0 {
                    DispatchQueue.main.async {
                        self.errorState = .Error(message: authResponse.token)
                    }
                    return
                } else {
                    // token received
                    self.errorState = .Success(message: "Successful password reset.")
                    UserDefaults.standard.setValue(authResponse.token, forKey: "token")
                    self.isSuccessAuth = true
                    self.token = authResponse.token
                }
            } catch {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
            }
        }.resume()
    }
    
    
    
    // Get data from server
    func getData(token: String, completion: @escaping (RegLogResponseM) -> Void) {
        let url = URL(string: "http://127.0.0.1:7000/api/auth/data")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: "No data received from server."))
                }
                return
            }
            do {
                let data = try JSONDecoder().decode(RegLogResponseM.self, from: data)
                if data.id == 0 { // Data recieved well.
                    print(data.token)
                    DispatchQueue.main.async {
                        self.errorState = .Success(message: "Successful data extraction from server.")
                        self.data = data.token
                        completion(RegLogResponseM(id: 0, token: data.token))
                    }
                } else {
                    DispatchQueue.main.async {
                        self.errorState = .Error(message: data.token)
                        completion(RegLogResponseM(id: data.id, token: data.token))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(RegLogResponseM(id: -1, token: error.localizedDescription))
                }
            }
        }.resume()
    }
    
    
    // Get users from server
    func getUsers(token: String, completion: @escaping ([UserM]) -> Void) {
        let url = URL(string: "http://127.0.0.1:7000/api/auth/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
//                    completion(RegLogResponse(id: -1, token: error.localizedDescription))
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
//                    completion(RegLogResponse(id: -1, token: "No data received from server."))
                }
                return
            }
            do {
                if data.count > 0 { // Data recieved well.
                    let data = try JSONDecoder().decode([UserM].self, from: data)

                    
                    print(data.count)
                    DispatchQueue.main.async {
                        self.errorState = .Success(message: "Successful users data extraction from server.")
                        self.users = data
//                        completion(RegLogResponse(id: 0, token: "Successful users data extraction from server."))
                    }
//                } else {
//                    DispatchQueue.main.async {
//                        self.errorState = .Error(message: data.token)
//                        completion(RegLogResponse(id: data.id, token: data.token))
//                    }
                }
            } catch {
                DispatchQueue.main.async {
//                    completion(RegLogResponse(id: -1, token: error.localizedDescription))
                }
            }
        }.resume()
    }
    
    
    
}
