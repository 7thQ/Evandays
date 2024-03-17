//
//  HostSomethingFunView.swift
//  EAH
//
//  Created by cosmo on 2/29/24.
//

import SwiftUI
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////


struct EventSubmissionView: View {
    @State private var eventName: String = ""
    @State private var eventDate: String = ""
    @State private var eventLocation: String = ""
    @State private var specialFeatures = [""]
    @State private var confirmationMessage: String = ""
    @State private var showSubmissionForm: Bool = true
    @State private var showTryAgainButton: Bool = false
    @State private var isEventSubmissionSuccessful: Bool = false
    @State private var serverTalking: String = ""


    let maxFeatures = 5 // Limit to 5 special features

    var body: some View {
        ScrollView {
            ZStack {

                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {

//                        
                    Text(isEventSubmissionSuccessful ? "Enjoy your Eventday!" : "Host Something Fun!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.top)
                        .applyCustomStyle()
                        // If you have a custom style, apply it here

                        
                        // Apply your custom style here
                    
                    Spacer()
                    
                    if showSubmissionForm {
                        TextField("Event Name", text: $eventName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Event Date", text: $eventDate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Event Location", text: $eventLocation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        ForEach(specialFeatures.indices, id: \.self) { index in
                            HStack {
                                TextField("Special Feature #\(index + 1)", text: $specialFeatures[index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                if specialFeatures.count > 1 {
                                    Button(action: {
                                        self.specialFeatures.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.red)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(.leading, 5)
                                }
                                
                                if index == specialFeatures.count - 1 && specialFeatures.count < maxFeatures {
                                    Button(action: {
                                        self.addFeature()
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.green)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(.leading, 5)
                                }
                            }.padding()
                        }
                        
                        Button("Submit Event") {
                            if areFieldsValid() {
                                submitEvent()
                            } else {
                                confirmationMessage = "Please fill in all fields before submitting."
                                showSubmissionForm = false
                                showTryAgainButton = true
                                
                            }
                        }
                        .padding()
                    } else {
                        Text(confirmationMessage)
                            .padding()
                        
                        if showTryAgainButton {
                            Button("Try Again") {

                                showSubmissionForm = true
                                showTryAgainButton = false
                                
                            }
                            .padding()
                        }
                    }
                }
                .padding(.top, 30)
            }
        }
    }

    func areFieldsValid() -> Bool {
        return !eventName.isEmpty && !eventDate.isEmpty && !eventLocation.isEmpty && specialFeatures.allSatisfy { !$0.isEmpty }
    }

    func addFeature() {
        if specialFeatures.count < maxFeatures {
            specialFeatures.append("")
        }
    }
    func submitEvent() {
        guard let url = URL(string: "http://172.20.10.5:3000/create-events") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "eventName": eventName,
            "eventDate": eventDate,
            "eventLocation": eventLocation,
            "specialFeatures": specialFeatures
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    do {
                        // Attempt to decode the response if your backend is structured to send a JSON response
                        let jsonResponse = try JSONDecoder().decode(EventCreationResponse.self, from: data)
                        if jsonResponse.message.contains("successfully") { // Customize this condition based on your actual success message
                            self.isEventSubmissionSuccessful = true
                            self.showSubmissionForm = false
                            self.confirmationMessage = jsonResponse.message
                        } else {
                            self.confirmationMessage = "Failed to create event. Please try again."
                            self.showTryAgainButton = true
                        }
                    } catch {
                        self.confirmationMessage = "Error parsing response: \(error.localizedDescription)"
                        self.showTryAgainButton = true
                    }
                } else if let error = error {
                    // If there is an error, display it
                    self.confirmationMessage = "Error: \(error.localizedDescription)"
                    self.showTryAgainButton = true
                }
            }
        }.resume()
    }

    
}



//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////


struct EventCreationResponse: Decodable {
    let message: String
    let totalEvents: Int
}



struct CustomStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.white) // .opacity(0.9) is optional
            .cornerRadius(10)
            .padding(.horizontal, 10)
            .padding(.bottom, 35)
            .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
    }
}

extension View {
    func applyCustomStyle() -> some View {
        self.modifier(CustomStyleModifier())
    }
}


struct CustomStyleForBoxing: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity)
            .border(Color.white)
        
            .cornerRadius(30)
    }
}

extension View {
    func CustomStyleForBoxing() -> some View {
        self.modifier(CustomStyleModifier())
    }
}





struct EventSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        EventSubmissionView()
//        gang()
//        bang()
    }
}
    
//import SwiftUI
//
//struct EventSubmissionView: View {
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var confirmationMessage: String = ""
//
//    var body: some View {
//        VStack {
//            // TextField for email input
//            TextField("Enter your email", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            // SecureField for password input
//            SecureField("Enter your password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            // Button to send the event submission request
//            Button("Submit Event") {
//                submitEvent(email: email, password: password)
//            }
//            .padding()
//
//            // Display the confirmation message
//            Text(confirmationMessage)
//        }
//    }
//
//    func submitEvent(email: String, password: String) {
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
//                }
//            }
//        }.resume()
//    }
//}

import SwiftUI

struct gang: View {
    // State variable to bind with the TextField and to display in the Text view
    @State private var userInput: String = ""
    
    var body: some View {
        // A vertical stack to arrange the views
        VStack {
            // The TextField for user input, binding it to the userInput variable
            TextField("Enter some text", text: $userInput)
                .padding() // Add some padding for better UI
                .border(Color.gray) // Add a border to indicate the input field

            // Displaying the user input below the TextField
            if !userInput.isEmpty {
                Text("You entered: \(userInput)")
                    .padding() // Add some padding for spacing
            }
        }
        .padding() // Add padding around the VStack for better UI appearance
    }
}

//
//import SwiftUI
//
//struct bang: View {
//    @State private var userInput: String = ""
//    @State private var showDisplayView = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter some text", text: $userInput)
//                    .padding()
//                    .border(Color.gray)
//
//                Button("Enter") {
//                    // Action to show the DisplayView with the current input
//                    showDisplayView = true
//                }
//                .padding()
//                // Navigation link to push the DisplayView onto the navigation stack
//                NavigationLink(destination: DisplayView(userInput: userInput), isActive: $showDisplayView) {
//                    EmptyView()
//                }
//            }
//            .padding()
//            .navigationTitle("Input")
//        }
//    }
//}
//
//import SwiftUI
//
//struct DisplayView: View {
//    var userInput: String
//
//    var body: some View {
//        VStack {
//            Text(userInput)
//                .padding()
//            Spacer()
//        }
//        .navigationTitle("Display")
//    }
//}
