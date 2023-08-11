//
//  PragmaWaveKeyboard.swift
//  Pragmatizer
//
//  Created by Paul Frank Pacheco Carpio on 10/08/23.
//

import Foundation
import SwiftUI
import Tonic
import Keyboard

struct PragmaWaveKeyboard: View {
	var firstOctave: Int
	var octaveCount: Int
	var noteOn: (Pitch, CGPoint) -> Void = {_, _ in}
	var noteOff: (Pitch) -> Void
	
	var body: some View {
		Keyboard(layout: .piano(pitchRange: Pitch(intValue: firstOctave * 12 + 24)...Pitch(intValue: firstOctave * 12 + octaveCount * 12 + 24)),
				 noteOn: noteOn,
				 noteOff: noteOff) { pitch, isActivated in
			KeyboardKey(pitch: pitch, isActivated: isActivated, text: "", pressedColor: Color.purple, flatTop: true)
		}.cornerRadius(6)
	}
}
