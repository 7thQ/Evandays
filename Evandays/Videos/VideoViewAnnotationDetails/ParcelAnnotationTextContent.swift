//
//  ParcelAnnotationTextContent.swift
//  EAH
//
//  Created by cosmo on 2/29/24.
//

import SwiftUI

struct ParcelAnnotationTextContent: View {
    var Rankgradient = Gradient(colors: [.yellow])
    var body: some View {
        Text("Davids House")
            .foregroundColor(.black)
            .truncationMode(.tail)
            .font(.caption2)
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Rankgradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
                .frame(width: 20, height: 20) // Slightly larger to ensure it's visible around the video
            Text("#1")
                .padding(3)
                .foregroundColor(.yellow)
                .background(Color.black.opacity(0.8))
                .cornerRadius(40)
                .truncationMode(.tail)
                .font(.caption2)
        }
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Rankgradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
                .frame(width: 20, height: 20) // Slightly larger to ensure it's visible around the video
            Text("Food!")
                .padding(3)
                .foregroundColor(.yellow)
                .background(Color.black.opacity(0.8))
                .cornerRadius(40)
                .truncationMode(.tail)
                .font(.caption2)
        }
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Rankgradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
                .frame(width: 20, height: 20) // Slightly larger to ensure it's visible around the video
            Text("candy")
                .padding(3)
                .foregroundColor(.yellow)
                .background(Color.black.opacity(0.8))
                .cornerRadius(40)
                .truncationMode(.tail)
                .font(.caption2)
        }
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Rankgradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
                .frame(width: 20, height: 20) // Slightly larger to ensure it's visible around the video
            Text("Party")
                .padding(3)
                .foregroundColor(.yellow)
                .background(Color.black.opacity(0.8))
                .cornerRadius(40)
                .truncationMode(.tail)
                .font(.caption2)
        }




    }
}

#Preview {
    ParcelAnnotationTextContent()
}





struct NewView: View {
    var eventName: String = ""
    var specialFeatures: [String] = []
    var totalEvents: Int = 0

    var body: some View {
        VStack {
            Text("Event Name: \(eventName)")
            Text("Special Features:")
            ForEach(specialFeatures, id: \.self) { feature in
                Text(feature)
            }
            Text("Total Events: \(totalEvents)")
        }
        .padding()
    }
}

#Preview {
    NewView()
}


struct EventResponse: Decodable {
    let eventName: String
    let specialFeatures: [String]
    let totalEvents: Int
}
