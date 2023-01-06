//
//  Moackup.swift
//  DemoStopWatch
//
//  Created by D. Prameswara on 05/01/23.
//

import SwiftUI

struct TimerMockup: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("99:99:999")
            }
            .font(.system(size: 50))
            .fontDesign(.monospaced)
            .padding()
            
            HStack {
                Button {
                    // todo: start timer
                } label: {
                    Label( "Start", systemImage: "play.fill")
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint( .blue)
                
                Button {
                    // todo: mark timer
                } label: {
                    Label( "Mark", systemImage: "pencil.and.ruler.fill")
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button {
                    // todo: cleanup marking
                } label: {
                    Label( "Clean", systemImage: "trash.fill")
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding()
            
            List {
                ForEach(0...100, id: \.self) { i in
                    Text("99:99:9999")
                }
            }
        }
    }
}

struct Moackup_Previews: PreviewProvider {
    static var previews: some View {
        TimerMockup()
    }
}
