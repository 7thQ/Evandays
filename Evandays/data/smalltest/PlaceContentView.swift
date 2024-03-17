

//
//import SwiftUI
//import Combine
//
//class UserSettings: ObservableObject {
//    @Published var score = 0
//}
//
//struct BombView: View {
//    @ObservedObject var settings = UserSettings()
//
//    var body: some View {
//        VStack {
//            Text("Your score is \(settings.score)")
//            Button("Increase Score") {
//                settings.score += 1
//            }
//        }
//    }
//}
//
//
//#Preview {
//    BombView()
//}
//

//import SwiftUI
//
//// Parent view that owns the state
//struct ParentView: View {
//    @State private var isChildViewVisible: Bool = false
//
//    var body: some View {
//        VStack {
//            Toggle("Show Child View", isOn: $isChildViewVisible)
//                .padding()
//
//            if isChildViewVisible {
//                // Pass the binding to the child view
//                ChildView(isVisible: $isChildViewVisible)
//            }
//        }
//    }
//}
//
//// Child view that uses a binding to the state owned by the parent
//struct ChildView: View {
//    // This is the binding from the parent view
//    @Binding var isVisible: Bool
//
//    var body: some View {
//        VStack {
//            Text("I'm the child view!")
//            Button("Hide me") {
//                // This button uses the binding to change the state
//                isVisible = false
//            }
//        }
//        .padding()
//        .border(Color.blue, width: 2)
//    }
//}
//
//#Preview{
//    ParentView()
//}



import SwiftUI


struct PlaceContentView: View {
    // Assume you want to show a specific number of VideoViews, you can adjust this count as needed
    private let videoCount: Int = 5

    var body: some View {
        ScrollView {
            AnnotationProfileDisplayWidget()
            VStack(spacing: 20) { // Adjust spacing as needed
                ForEach(0..<videoCount, id: \.self) { _ in
                    VideoView()
                        .frame(height: 794) // Adjust the frame size as needed
                }
            }
        }
    }
}
#Preview{
    PlaceContentView()
}

