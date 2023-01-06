//
//  TimerWithScheduler.swift
//  DemoStopWatch
//
//  Created by D. Prameswara on 06/01/23.
//

import SwiftUI

struct TimerWithScheduler: View {
    // flag apakah timer sedang run
    @State private var timerRun: Bool = false
    // start date
    @State private var start: TimeInterval = 0.0
    // untuk menyimpan selisih antara waktu start dengan current
    @State private var interval: TimeInterval = 0.0
    // string dari selisih timer dalam format menit:detik:mili
    @State private var waktu = "00:00:000"
    // array untuk menyimpan hasil marking waktu
    @State private var mark = [String]()

    @State private var timer: Timer?

    private func startTimer() {
        if timerRun {
            return
        }
        interval = 0.0
        start = Date.timeIntervalSinceReferenceDate

        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            interval = Date.timeIntervalSinceReferenceDate - start

            let mili = Int((interval.truncatingRemainder(dividingBy: 1)) * 1000)
            let detik = Int(interval.truncatingRemainder(dividingBy: 60))
            let menit = Int(interval / 60)

            waktu = String(format: "%02d:%02d:%03d", menit, detik, mili)
        }
        timerRun = true
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerRun = false
    }

    private func markTimer() {
        mark.append(waktu)
    }

    var body: some View {
        VStack {
            // info timer
            HStack {
                Text(waktu)
            }
            .font(.system(size: 50))
            .fontDesign(.monospaced)
            .padding()

            // tombol
            HStack {
                Button {
                    if timerRun {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                } label: {
                    Label(timerRun ? "Stop" : "Start",
                          systemImage: timerRun ? "stop.fill" : "play.fill"
                    )
                    .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(timerRun ? .orange : .blue)

                if timerRun {
                    Button {
                        markTimer()
                    } label: {
                        Label("Mark",
                              systemImage: "pencil.and.ruler.fill"
                        )
                        .padding(5)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }

                Button {
                    mark = []
                } label: {
                    Label("Clean", systemImage: "trash.fill")
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding()

            // list hasil
            List {
                ForEach(mark, id: \.self) { i in
                    Text(i)
                }
            }
        }
    }
}

struct TimerWithScheduler_Previews: PreviewProvider {
    static var previews: some View {
        TimerWithScheduler()
    }
}
