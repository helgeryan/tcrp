//
//  ExerciseView.swift
//  tcrp
//
//  Created by Ryan Helgeson on 7/24/23.
//

import SwiftUI
import AVKit
struct ExerciseView: View {
    let exercise: Exercise
    let player = AVPlayer(url: Bundle.main.url(forResource: "golfswing", withExtension: "mov")!)
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                VideoPlayer(player: player).frame(width: 300, height: 300 / 0.5625)
            }
            .frame(width: 300, height: 300, alignment: .center)
            .clipped()
            .cornerRadius(20)
            
            Text("\(exercise.description)")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
            Text("\(exercise.reps) reps")
                .fontWeight(.semibold)
                .font(.system(size: 14))
            
            if exercise.weight != 0 {
                Text("\(exercise.weight)")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .onAppear {
            addObserver()
            player.play()
            player.isMuted = true
            print(player.currentItem?.presentationSize)
            print(UIScreen.main.bounds.size)

        }
        .onDisappear {
            removeObserver()
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.large)
    }
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem,
                                               queue: nil) { notif in // 3
            player.seek(to: .zero) // 4
            player.play() // 5
        }
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self,  // 6
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: Exercise(name: "Back Extension", reps: 12, weight: 0, description: "This is to strengthen your back"))
    }
}
