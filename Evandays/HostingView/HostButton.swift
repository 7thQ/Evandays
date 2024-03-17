//
//  HostButton.swift
//  EAH
//
//  Created by cosmo on 3/4/24.
//


import SwiftUI

struct MainNavigationView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination:  EventSubmissionView()) {
                    Text("Host Something Fun! ")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                
                .CustomStyleForBoxing()
                
            
                .cornerRadius(10)
                
            
                NavigationLink(destination: HostingView()) {
                    Text("Currently Hosting")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .CustomStyleForBoxing()
                .cornerRadius(0)
//                gang()
//                bang()
                
            }
          
            


         
        }
    }
}


#Preview {
    MainNavigationView()
}
















// all these bello wone shows you a navigation whay of switching pages and the othe rone shows you how to complete change you page

//
//
//
//
//struct   HostButtonNav: View {
//    // State to manage the navigation
//    @State private var navigateToEventSubmission = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Spacer()
//                
//                // Big play button
//                Button(action: {
//                    // Action to change the state and navigate to EventSubmissionView
//                    self.navigateToEventSubmission = true
//                }) {
//                    Image(systemName: "play.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(.blue)
//                }
//                .background(NavigationLink(destination: EventSubmissionView(), isActive: $navigateToEventSubmission) {
//                    EmptyView()
//                }.hidden())
//                
//                Spacer()
//            }
//            .navigationTitle("Home")
//        }
//    }
//}
//
//
//
//#Preview {
//    HostButtonNav()
//}
//
//
//
//
//
//struct  HostButtonEnum: View {
//    enum ViewState {
//        case home
//        case eventSubmission
//    }
//
//    // State to manage the current view
//    @State private var currentState: ViewState = .home
//    
//    var body: some View {
//        switch currentState {
//        case .home:
//            VStack {
//                Spacer()
//                
//                // Big play button
//                Button(action: {
//                    // Change the state to switch the view
//                    self.currentState = .eventSubmission
//                }) {
//                    Image(systemName: "play.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(.blue)
//                }
//                
//                Spacer()
//            }
//        case .eventSubmission:
//            EventSubmissionView()
//        }
//    }
//}
//
//
//
//#Preview {
//    HostButtonEnum()
//}
//
//
//
//
