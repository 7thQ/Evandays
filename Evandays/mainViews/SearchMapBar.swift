//
//  SearchMapBar.swift
//  EAH
//
//  Created by cosmo on 2/25/24.
//

import SwiftUI

struct SearchMapBar: View {
    @State private var islegendpresented  = false
    @State private var textFieldInput: String = ""
  
    var body: some View {
        VStack{
                   ZStack{

                       HStack{
                           Spacer()
                           HStack{
                               Button(action: { /* who you follow/maps Action 2 */ }) {

                                   TextField("What are you feeling like today?", text: $textFieldInput)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .padding(0)
                                       .cornerRadius(10)
                                       .padding(.trailing, 10)

                               }

                           }
                           .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)

                           Spacer()

                           HStack{

                               Button(action: { islegendpresented = true}) {
                                   Text("Legend")
                                       .padding(13)
                                       .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.4)) // Dark Emerald Green
                                       .background(Color.white/*.opacity(0.9)*/)
                                       .cornerRadius(4)
                                       .sheet(isPresented:
                                               $islegendpresented ) {
                                           SwiftUIRoot()
                                                           }
                               }
                           }
                           .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)

                           Spacer()

                       }

                   }
            HStack{
                Spacer()
                Text("Currnet-Map: Evanddays")
                    .padding(1)
                    .foregroundColor(Color.black) // Dark Emerald Green
                    .background(Color.white/*.opacity(0.9)*/)
                    .cornerRadius(4)
                    .shadow(color: Color.black.opacity(0.95), radius: 3, x: 0, y: 0)
            }
            .padding(.top,25)
            .padding(.trailing)

                   Spacer()

               }
    }
}



#Preview {
    SearchMapBar()
}


