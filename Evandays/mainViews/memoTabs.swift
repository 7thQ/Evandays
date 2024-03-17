//
//  memoTabs.swift
//  EAH
//
//  Created by cosmo on 1/28/24.
//

//


import SwiftUI
struct MemoriesSavedView: View {
    var body: some View {
        NavigationView {
            List {
                // Loop to create multiple rows
                ForEach(0..<7, id: \.self) { _ in
                    HStack(spacing: 2) { // Horizontal stack to place rectangles next to each other
                        ForEach(0..<3, id: \.self) { _ in
                            Rectangle()
                                .foregroundColor(.gray) // Placeholder color
                                .aspectRatio(9/16, contentMode: .fit) // Video aspect ratio
                        }
                    }
                    
                    .frame(height: 180) // Set a fixed height for each row
                   
                }
                
              
               
            }
            
            .navigationTitle("Memories") // Set the navigation bar title
           
        }
        .frame(height: 590)
        .padding(6)
        .cornerRadius(40)
        .background(Color.white)
        .padding(5)
        .cornerRadius(30)
        
        
    }
}


#Preview {

    MemoriesSavedView()

}
