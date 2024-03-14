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
           
            
        
        }
        
    }
}

#Preview {
    ContentView()
}
