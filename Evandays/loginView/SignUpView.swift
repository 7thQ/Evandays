


import SwiftUI

struct SignUpView: View {
    let minimumAge = 6
    let maximumAge = 169
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var address: String = ""
    @State private var age: Int = 6
    @State private var phoneNumber: String = ""
    @State private var confirmationMessage: String = ""
    @State private var showSignUpForm: Bool = true
    @State private var showTryAgainButton: Bool = false // State to control the visibility of the "Try Again" button
    
    var body: some View {
        VStack {
            if showSignUpForm {
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Other TextFields and SecureField here
                
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Enter your address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Age", selection: $age) {
                    ForEach(minimumAge...maximumAge, id: \.self) { age in
                        Text("\(age)").tag(age)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 80)
                .clipped()

                TextField("Enter your phone number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()


                Button("Sign Up") {
                    if areFieldsValid() {
                        sendPostRequest(name: name, email: email, password: password, address: address, age: age, phoneNumber: phoneNumber)
                    } else {
                        confirmationMessage = "No information inputted, click this button to try again."
                        showSignUpForm = false
                        showTryAgainButton = true
                    }
                }
                .padding()
            } else {
                Text(confirmationMessage)
                    .padding()
                
                if showTryAgainButton {
                    Button("Try Again") {
                        // Reset the view for the user to try again
                        confirmationMessage = ""
                        showSignUpForm = true
                        showTryAgainButton = false
                    }
                    .padding()
                }
            }
        }
    }

    func areFieldsValid() -> Bool {
        return !name.isEmpty && !email.isEmpty && !password.isEmpty && !address.isEmpty && !phoneNumber.isEmpty
    }

    func sendPostRequest(name: String, email: String, password: String, address: String, age: Int, phoneNumber: String) {
        // Your existing sendPostRequest implementation
        
            guard let url = URL(string: "http://172.20.10.5:3000/create-user") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body: [String: Any] = [
                "name": name,
                "email": email,
                "password": password,
                "address": address,
                "age": age,
                "phoneNumber": phoneNumber
            ]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error == nil {
                        // If there is no error, hide the sign-up form and show the confirmation message
                        self.showSignUpForm = false
                        self.confirmationMessage = "Slide down view to login"
                    } else {
                        // If there is an error, display it
                        self.confirmationMessage = "Error: \(error!.localizedDescription)"
                    }
                }
            }.resume()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

// we also gotta make sure that on the sign-up part when you hit sign up, if the user already exist first we have to check if these are already exist let the person know the user already exists because right now it just say slide down like if it went through which it does because the user does exist, but if a different user tries to make the same account as another person, that's why we're having this in place, so no account can be replicated no account replicates, but it doesn't let you know that it there is already an account
