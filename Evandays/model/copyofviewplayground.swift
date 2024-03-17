//
//
//






import SwiftUI

struct bom: View {
    var body: some View {
        Button("Send Budding Signal") {
            sendBuddingSignal()
        }
    }
    
    func sendBuddingSignal() {
        guard let url = URL(string: "http://localhost:3000/budding") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending signal: \(error)")
                return
            }
            print("Budding signal sent successfully")
        }
        task.resume()
    }
}

#Preview{
        bom()
    }


