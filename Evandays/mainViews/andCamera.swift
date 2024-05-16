


import SwiftUI
import CameraXPN


struct cameraView: View {
    @State private var showMemoriesSavedView = false
    @State private var host = false

    var body: some View {
        ZStack {
            CameraXPN(action: { url, data in
                print(url)
                print(data.count)
                uploadMedia(url: url)


                
            }, font: .subheadline, permissionMessgae: "Permission Denied", useMediaContent: "0")
            
 
            VStack {
                Spacer()
                HStack{
                   
                    VStack { // Use VStack here for vertical stacking
                        Button(action: {
                            self.showMemoriesSavedView = true
                        }) {
                            Image(systemName: "brain")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding()
                        }
                        
                        
                        
//                        .padding(.vertical) // Adjust padding as needed
                        
                        Button(action: {
                            self.host = true
                        }) {
                            Image(systemName: "party.popper")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding()
//                        .padding(.vertical) // Adjust padding as needed
                    }
                    .background(Color.black)
                    .cornerRadius(18)
                    .padding(.bottom, 10)
                    .frame(width: 50) // Adjust the frame as needed
                    .padding(.leading, 30) // Adjust the padding as needed
                    Spacer()
                }
                .padding(.trailing, -50)
    
            }
  
        }
        .sheet(isPresented: $host) {
            EventSubmissionView()
            
        }
        .sheet(isPresented: $showMemoriesSavedView) {
            MemoriesSavedView()
            
        }
    }

    
    func uploadMedia(url: URL) {
        guard let uploadURL = URL(string: "http://172.20.10.5:3000/upload") else { return } // Your backend endpoint

        var request = URLRequest(url: uploadURL)
        request.httpMethod = "POST"
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Assuming `url` is the local file URL to the media you want to upload
        do {
            let mediaData = try Data(contentsOf: url)
            let filename = url.lastPathComponent
            let mimeType = "video/mp4" // Adjust based on your media type; e.g., "image/jpeg" for images
            
            // Prepare the multipart body
            data.append("--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
            data.append(mediaData)
            data.append("\r\n".data(using: .utf8)!)
            data.append("--\(boundary)--\r\n".data(using: .utf8)!)
        } catch {
            print("Error preparing data for upload: \(error.localizedDescription)")
            return
        }
        
        // Perform the upload
        URLSession.shared.uploadTask(with: request, from: data) { responseData, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    // Handle the error scenario
                    print("Upload error: \(error.localizedDescription)")
                }
                return
            }
            
            if let responseData = responseData, let responseString = String(data: responseData, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Handle the successful upload scenario
                    print("Upload response: \(responseString)")
                }
            }
        }.resume()
    }

}


#Preview{
    cameraView()
}

