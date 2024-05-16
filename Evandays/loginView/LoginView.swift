





import SwiftUI

//struct SimpleRequestView: View {
//    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false // Using AppStorage to manage login state
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var confirmationMessage: String = ""
//    @State private var showingSignUp = false // To control the presentation of the SignUpView
//
//    var body: some View {
//        VStack {
//            if isLoggedIn {
//                // Your main app content goes here
//                Text("Welcome!")
//                // Add a logout button or similar to set isLoggedIn to false when needed
//            } else {
//                // TextField for email input
//                TextField("Enter your email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                // SecureField for password input
//                SecureField("Enter your password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                // Button to send the login request
//                Button("Login") {
//                    login(email: email, password: password)
//                }
//                .padding()
//
//                // Button to show the sign-up sheet
//                Button("Sign Up") {
//                    showingSignUp.toggle()
//                }
//                .sheet(isPresented: $showingSignUp) {
//                    SignUpView() // Your SignUpView goes here
//                }
//
//                // Display the confirmation message
//                Text(confirmationMessage)
//            }
//        }
//    }
//
//    func login(email: String, password: String) {
//        guard let url = URL(string: "http://172.20.10.5:3000/login") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = ["email": email, "password": password]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.confirmationMessage = "Error: \(error.localizedDescription)"
//                }
//                return
//            }
//
//            if let data = data, let responseString = String(data: data, encoding: .utf8) {
//                DispatchQueue.main.async {
//                    self.confirmationMessage = responseString
//                    if responseString.contains("Login successful") {
//                        self.isLoggedIn = true // Set isLoggedIn to true on successful login
//                    }
//                }
//            }
//        }.resume()
//    }
//}

struct SimpleRequestView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var loginInfo = whoLoggedIn()
    @AppStorage("username") var storedUsername: String = ""
    @State private var showingconfimation = false
    @State private var confimationMessage = ""
    

    var body: some View {
        ScrollView{
            VStack {
                TextField("Enter Username", text: $loginInfo.inputUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $loginInfo.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Log In") {
                    Task{
                        await valitdateUser()
                    }

                    storedUsername = loginInfo.inputUsername  // Save the username
                }
            }
        }.alert("shit worked g", isPresented: $showingconfimation){Button("ok"){}}message: {
            Text(confimationMessage)
        }
    }
    
    func valitdateUser() async {
        guard let encoded = try? JSONEncoder().encode(loginInfo) else{
            print("failed")
            return
        }//encoding the model sending over
      
        let url = URL(string: "https://reqres.in/api/test")!//we are requesting from
        var request = URLRequest(url: url)//initializing the url
        request.setValue("application/json", forHTTPHeaderField: "content-Type")//configure the request
        request.httpMethod = "Post"//method obvisouly
        
        do {
            let (data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedwhoLoggedIn = try JSONDecoder().decode(whoLoggedIn.self, from: data)
            confimationMessage = "your credentials \(decodedwhoLoggedIn.inputUsername), \(decodedwhoLoggedIn.password)"
        
            
            showingconfimation = true
            if showingconfimation {
                isLoggedIn = true
            }
            
            
        }catch{print("failed:\(error.localizedDescription)")}
        
        
    }

    
}

//
//struct SimpleRequestView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleRequestView()
//    }
//}


#Preview{
    SimpleRequestView()
    
}








//-------------------------------------one way signal strings to server


//    func sendPostRequest(name: String, email: String) {
//        guard let url = URL(string: "http://172.20.10.5:3000/simple-post") else { return } // Replace with your actual server URL
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        // Include both name and email in the request body
//        let body: [String: Any] = ["name": name, "email": email]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    confirmationMessage = "Error: \(error.localizedDescription)"
//                }
//            } else {
//                DispatchQueue.main.async {
//                    confirmationMessage = "Request received!"
//                }
//            }
//        }.resume()
//    }


//-------------------------------------one way signal touching
