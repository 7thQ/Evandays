//
//  andPost.swift
//  EAH
//
//  Created by cosmo on 2/2/24.
//

import SwiftUI

struct andPostView: View {
    // Assume you want to show a specific number of VideoViews, you can adjust this count as needed
    private let videoCount: Int = 5

    var body: some View {
        ScrollView {
            
            VStack(spacing: 20) { // Adjust spacing as needed
                ForEach(0..<videoCount, id: \.self) { _ in
                    VideoView()
                        .frame(height: 852) // Adjust the frame size as needed
                }
            }
        }
        .ignoresSafeArea()
    }
}
#Preview{
    andPostView()
}
