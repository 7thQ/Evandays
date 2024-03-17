

import SwiftUI


struct custNav: View {
    // Start of head
    @State private var isCameraViewPresented = false
//    @State private var andpostedpresented = false
//    @State private var isprofilepresented = false
//    @State private var ismappresented = false
    @State private var ismessagespresented = false
    @State private var activeView: ActiveView = .none
//__------------------------______----------------------
    enum ActiveView {
        case none, /*messages, map, */andPost, profile
    }
    // END of Head
    var body: some View {
        
        
        ZStack {
            
            //First line of zstack
            switch activeView {
//            case .messages:
//                messagesView() // Your Messages View
//            case .map:
//                mapView() // Your Map View
            case .andPost:
                andPostView() // Your AndPost View
            case .profile:
                profileView() // Your Profile View
            case .none:
                mapView() // Default view when no tab is selected
            }// end of switch function
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            VStack {
                //First line of vstack
                
                Spacer()
                
                HStack {
                    //First line of hstack
                        
                    
                    Button(action: {
                        ismessagespresented = true
                    }) {
                        Image(systemName: "ellipsis.message.fill")
                            .foregroundColor(.black)
                            .padding(.trailing,40)
                    }
                    .sheet(isPresented:
                            $ismessagespresented) {
                            messagesView()
                                        }

                    // button shows widgets slide up
//                    __------------------------____
                    

                    Button(action: {
                        activeView = .none
                    }) {
                        Image(systemName: "globe.americas")
                            .foregroundColor(.black)
                            .padding(.trailing,40)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        activeView = .andPost
                    }) {
                        Image(systemName: "play")
                            .foregroundColor(.black)
                            .padding(.leading,40)
                    }
                    
                    Button(action: {
                        activeView = .profile
                    }) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                            .padding(.leading, 40)
                    }
                    
                    //theses button are active button that take you to the complete page
//if u to go to a page but have that "back" button use NavigationStack {
//                    NavigationLink(destination: MessagesView()) {
//                        Image(systemName: "ellipsis.message.fill")
//                            .padding(.trailing, 40)
//                    }
 //  }
                    //last line of hstack
                } // end of hstack
                
                
                .padding()
                .background(Color.white/*.opacity(0.9)*/)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .padding(.bottom, 35)
                .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
        
                //last line of vstack
            } // end of vstack1
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            //                    __------------------------____
            VStack{
                //First line of vstack
                Spacer()
                HStack {
                    //First line of hstack
                    Button(action: {
                        isCameraViewPresented = true
                    }) {
                        Text("&")
                            .padding(5)
                            .font(.system(size: 45)) // Set the text size to 24 points
                            .foregroundColor(.black)
                            .shadow(color: Color.black.opacity(9.95), radius: 3, x: 0, y: 0)

                    }
                    .padding()
                    .background(Circle().fill(Color.white))
                    .cornerRadius(60)
                    .padding(.bottom)
                    .sheet(isPresented: $isCameraViewPresented) {
                        cameraView()
                        //Your actual camera view
                    }
                    //last line of hstack
                }//end of hstack
                .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
                //last line of vstack
            }//end of vstack2
            Events_Memories_Widgets()
            //last line of zstack
        }//End of zstack
        
        
    }
}
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
//                    __------------------------____
#Preview {
    custNav()
}
