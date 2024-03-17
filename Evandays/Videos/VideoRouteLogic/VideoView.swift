//
//  VIdeoView.swift
//  EAH
//
//  Created by cosmo on 2/25/24.
//

import SwiftUI
import AVKit

struct VideoView: View {
    private let player = AVPlayer(url: Bundle.main.url(forResource: "RPReplay_Final1707697863 2", withExtension: "MOV")!)

    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.play()
            }
            .ignoresSafeArea()
    }
}

#Preview{
        VideoView()
    }

