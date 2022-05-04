//
//  VideoView.swift
//  Learning App
//
//  Created by Amish Tufail on 04/05/2022.
//

import SwiftUI
import AVKit

struct VideoView: View {
    @State var player = AVPlayer()
    var videoName: String
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mp4")!)
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoName: "Video1")
    }
}
