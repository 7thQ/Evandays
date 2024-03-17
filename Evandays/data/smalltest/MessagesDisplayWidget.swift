//
//
//
//
//import SwiftUI
//import Combine
//
//// Define an observable object with a published property.
//class SharedData: ObservableObject {
//    @Published var message = "Hello, World!"
//}
//
//// Define the first view that displays the message.
//struct MessageView: View {
//    @EnvironmentObject var data: SharedData
//
//    var body: some View {
//        Text(data.message) // The text will automatically update when the message changes.
//            .padding()
//    }
//}
//
//// Define the second view with a button to change the message.
//struct ChangeMessageView: View {
//    @EnvironmentObject var data: SharedData
//
//    var body: some View {
//        Button("Change Message") {
//            data.message = "Hello, SwiftUI!"
//        }
//        .padding()
//    }
//}
//
//// Define the main view that sets up the environment and contains the other two views.
//struct ContentView: View {
//    @StateObject private var sharedData = SharedData() // Create a single instance of SharedData.
//
//    var body: some View {
//        VStack {
//            MessageView()
//            ChangeMessageView()
//        }
//        .environmentObject(sharedData) // Pass the sharedData to the environment.
//    }
//}
//
//// Set up the preview for ContentView.
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




//
//import SwiftUI
//
//struct LoginView: View {
//    @State private var username: String = ""
//    @State private var password: String = ""
//
//    var body: some View {
//        VStack {
//            TextField("Username", text: $username)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            Button("Login") {
//                login()
//            }
//            .padding()
//        }
//    }
//
//    func login() {
//        let url = URL(string: "http://172.20.10.5:3000/login")! // Use your actual server IP and port
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let credentials = ["username": username, "password": password]
//        request.httpBody = try? JSONEncoder().encode(credentials)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, let responseString = String(data: data, encoding: .utf8) {
//                print("Response: \(responseString)")
//            } else if let error = error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//
//
//}
//
//#Preview {
//    LoginView()
//}



import SwiftUI

struct MessagesDisplayWidget: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<20, id: \.self) { index in
                    HStack(spacing: 12) {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("User \(index)")
                                .fontWeight(.bold)

                            Text("Last message snippet...")
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Messages")
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesDisplayWidget()
    }
}
