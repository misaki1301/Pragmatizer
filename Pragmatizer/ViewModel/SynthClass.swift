//
//  SynthClass.swift
//  Pragmatizer
//
//  Created by Paul Frank Pacheco Carpio on 10/08/23.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import Tonic

class SynthClass: ObservableObject {
	let engine = AudioEngine()
	var oscillatorList =
	[
		MorphingOscillator(index: 0.75, detuningOffset: -0.5),
		MorphingOscillator(index: 0.75, detuningOffset: 0.5),
		MorphingOscillator(index: 2.75)
	]
	@Published var data = MorphingOscillatorData() {
		didSet {
			if data.isPlaying {
				for i in 0...2 {
					oscillatorList[i].start()
					oscillatorList[i].$amplitude.ramp(to: data.amplitude, duration: 0)
				}
				oscillatorList[0].$frequency.ramp(to: data.frequency, duration: data.rampDuration)
				oscillatorList[1].$frequency.ramp(to: data.frequency, duration: data.rampDuration)
				oscillatorList[2].$frequency.ramp(to: data.octaveFrequency, duration: data.rampDuration)
			} else {
				for i in 0...2 {
					oscillatorList[i].amplitude = 0.0
				}
			}
		}
	}
	@Published var octave = 1
	@Published var noteRange = 2
	
	
	init() {
		engine.output = Mixer(oscillatorList[0], oscillatorList[1], oscillatorList[2])
		try? engine.start()
	}
	
	func noteOn(pitch: Pitch, point: CGPoint) {
		data.isPlaying = true
		data.frequency = AUValue(pitch.midiNoteNumber).midiNoteToFrequency()
		data.octaveFrequency = AUValue(pitch.midiNoteNumber - 12).midiNoteToFrequency()
	}
	
	func noteOff(pitch: Pitch) {
		data.isPlaying = false
	}
}
