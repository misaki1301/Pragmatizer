//
//  ContentView.swift
//  Pragmatizer
//
//  Created by Paul Pacheco on 12/07/23.
//

import SwiftUI
import AudioKit
import SoundpipeAudioKit
struct ContentView: View {
	
	let engine = AudioEngine()
	let oscillator = DynamicOscillator(amplitude: 0)
	
	init() {
		engine.output = oscillator
		do {
			oscillator.setWaveform(Table(.sine))
			try engine.start()
		} catch {
			print("cant start engine audiokit")
		}
	}
	
    var body: some View {
        VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
				.font(.custom("", size: 128))
			Text("PlanetWaves")
				.font(.custom("", size: 64))
			HStack{
				Button(action: {
					oscillator.setWaveform(Table(.square))
				}) {
					Text("Square")
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
				Button(action: {
					oscillator.setWaveform(Table(.triangle))
				}) {
					Text("Triangle")
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
				Button(action: {
					oscillator.setWaveform(Table(.sawtooth))
				}) {
					Text("SawTooth")
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
				Button(action: {
					oscillator.setWaveform(Table(.sine))
				}) {
					Text("Sine")
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
			}
			Button(action: {play()}) {
				Text("Play OSC")
			}
				.buttonStyle(.borderedProminent)
        }
        .padding()
    }
	
	func play() {
		oscillator.isStarted ? oscillator.stop() : oscillator.start()
		//oscillator.setWaveform(Table(.sine))
		oscillator.$frequency.ramp(to: 440, duration: 0)
		oscillator.$amplitude.ramp(to: 1, duration: 0.01)
//		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//			oscillator.$amplitude.ramp(from: 440, to: 0, duration: 0.01)
//		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
