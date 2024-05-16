





import SwiftUI

struct AnnotationProfileDisplayWidget: View {
    var body: some View {

        ZStack{
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: "gear") // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .foregroundColor(.white)
                    .padding(.top, 60)
                
                Text("Username") // Replace with the actual username
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("1,000 Followers") // Replace with the actual follower count
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                
                // Additional profile information can be added here
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(20)
            .padding()
            
            // Adjust vertical padding as needed
            
        }
            .padding(.vertical,10) // Adjust vertical padding as needed
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .ignoresSafeArea()
        

       

    }
    
}

struct ProfileDisplayWidget: View {
    @AppStorage("username") var username: String = ""
    var body: some View {

        ZStack{
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: "gear") // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .foregroundColor(.white)
                    .padding(.top, 60)
                
                Text("\(username)") // Replace with the actual username
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("1,000 Followers") // Replace with the actual follower count
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                
                // Additional profile information can be added here
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(20)
            .padding()
            
            // Adjust vertical padding as needed
            
        }
            .padding(.vertical,10) // Adjust vertical padding as needed
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .ignoresSafeArea()
        

       
        
    }
    
}

#Preview {
    AnnotationProfileDisplayWidget()
    }

#Preview {
        ProfileDisplayWidget()
    }




