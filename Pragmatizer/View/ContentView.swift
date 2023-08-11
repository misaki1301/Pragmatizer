//
//  ContentView.swift
//  Pragmatizer
//
//  Created by Paul Pacheco on 12/07/23.
//

import SwiftUI
import AudioKit
//for oscilators and effects
import SoundpipeAudioKit
//for the knobs
import Controls
// for keyboard
import Keyboard
import Tonic

struct ContentView: View {
	
	@StateObject var conductor = SynthClass()
	
    var body: some View {
		ZStack {
			RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 2, endRadius: 1200).edgesIgnoringSafeArea(.all)
			VStack {
				Spacer()
				HStack {
					Button(action: {conductor.noteRange = max(1, conductor.noteRange - 1)}) {
						Image(systemName:"arrowtriangle.backward.fill")
							.foregroundColor(.white)
					}
					Text("Range: \(conductor.noteRange + 1)")
					Button(action: {conductor.noteRange = max(4, conductor.noteRange + 1)}) {
						Image(systemName:"arrowtriangle.forward.fill")
							.foregroundColor(.white)
					}
					Button(action: {conductor.octave = max(-2, conductor.octave - 1)}) {
						Image(systemName:"arrowtriangle.backward.fill")
							.foregroundColor(.white)
					}
					Text("Octave: \(conductor.octave)")
					Button(action: {conductor.octave = max(3, conductor.octave + 1)}) {
						Image(systemName: "arrowtriangle.forward.fill")
							.foregroundColor(.white)
					}
				}
				PragmaWaveKeyboard(
					firstOctave: conductor.octave, octaveCount: conductor.noteRange, noteOn: conductor.noteOn(pitch:point:), noteOff: conductor.noteOff)
				.frame(maxHeight: 350)
			}
		}
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.previewInterfaceOrientation(.landscapeLeft)
    }
}
