

import SwiftUI
struct profileView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: String = ""

    var body: some View {
//        NavigationView {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ProfileDisplayWidget()
//            .padding(.top,100)
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "isLoggedIn") // Reset the login flag
                    
                }) {
                    
                    Image(systemName: "gear")
                                .imageScale(.large)
                              
    //       make sure to add a way for the backend to know the logged out, and a way in the
                            //backend for me to kick a user out
                        }
//                tentView()
                PostsView()

                   

        }
            .padding(.top,-88)
        }
    }
}



#Preview {
    profileView()
}
