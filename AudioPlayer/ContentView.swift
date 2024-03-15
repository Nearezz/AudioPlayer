//
//  ContentView.swift
//  AudioPlayer
//
//  Created by NYCDOE on 3/13/24.
//

import SwiftUI
import AVFoundation
import UIKit

struct ContentView: View {
    @State private var audiPlayer: AVAudioPlayer?
    @State private var isPlaying : Bool = false
    @State private var storedTime: TimeInterval = 0
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.play()}) {
                    Image(systemName: "play.sqaure.fill")
                        .font(.system(size: 50.0))
                }
                Button(action: {self.pause()}) {
                    Image(systemName: "pause.rectangle.fill")
                        .font(.system(size: 50.0))
                }
                Button(action: {self.stop()}) {
                    Image(systemName: "xmark.sqaure.fill")
                        .font(.system(size: 50.0))
                }
                ProgressView("Progress",value: progress,total: 1.0)
                    .id(progress)
                    .frame(width:200,height:200)
            }
        }
        
        
        
    }
    
    
    func play() {
        guard let fileURL = Bundle.main.url(forResource:"for-elise-background-music-for-video-dance-electro-house-version-179316", withExtension: "mp3") else {
            print("Error finding audio file")
            return
        }
        
        do {
            if audiPlayer == nil {
                audiPlayer = try AVAudioPlayer(contentsOf: fileURL)
            }
            
            audiPlayer?.currentTime = storedTime
            audiPlayer?.play()
            isPlaying = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
                timer in self.updateProgress()}
            
                 
        } catch {
            print("Error playing audio \(error)")
        }
    }
    
    func pause() {}
    func stop() {}
    func updateProgress(){}
    
}

#Preview {
    ContentView()
}
