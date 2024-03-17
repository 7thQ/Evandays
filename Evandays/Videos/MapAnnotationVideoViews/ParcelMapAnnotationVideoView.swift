

import SwiftUI
import AVKit
import AVFoundation

struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false // Hide playback controls
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update the controller if needed
    }
}

struct ParcelMapAnnotationVideoView: View {
    private let player = AVPlayer(url: Bundle.main.url(forResource: "RPReplay_Final1707697863 2", withExtension: "MOV")!)
//    var gradient = Gradient(colors: [.yellow, .red, .purple, .orange, .pink, .red])
    var gradient = Gradient(colors: [.white,.black, .white])
    var Rankgradient = Gradient(colors: [.yellow])

    var body: some View {
        VStack{
            ZStack {
                CustomVideoPlayer(player: player)
                    .frame(width: 30, height: 30) // Set the desired size of the video
                    .clipShape(Circle()) // Clip the video to a circular shape
                    .onAppear {
                        player.play()
                        NotificationCenter.default.addObserver(
                            forName: .AVPlayerItemDidPlayToEndTime,
                            object: player.currentItem,
                            queue: .main
                        ) { _ in
                            player.seek(to: CMTime.zero)
                            player.play()
                        }
                    }
                    .onDisappear {
                        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
                        player.pause()
                        player.replaceCurrentItem(with: nil)
                    }

                Circle()
                    .stroke(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)
                    .frame(width: 34, height: 34) // Slightly larger to ensure it's visible around the video
                
            }
            ParcelAnnotationTextContent()


        }
 

    }
}

#Preview{
    ParcelMapAnnotationVideoView()
    }




//
//// View with controllers in below this text
////
//import SwiftUI
//import AVKit
//
//struct  MapAnnotationVideoView: View {
//    private let player = AVPlayer(url: Bundle.main.url(forResource: "RPReplay_Final1707697863 2", withExtension: "MOV")!)
//    var gradient = Gradient(colors: [.yellow, .red, .purple, .orange, .pink, .red])
//
//    var body: some View {
//        VideoPlayer(player: player)
//            .frame(width: 60, height: 60) // Set the desired size of the circle
//            .clipShape(Circle()) // Clip the video to a circle shape
//            .overlay(Circle().stroke(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2.5)) // Add a gradient border
//            .onAppear {
//                player.play()
//            }
//    }
//}
//
//struct TicketView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapAnnotationVideoView()
//    }
//}
//
//// View with controllers in above this text
