//
//  MorphingOscillator.swift
//  Pragmatizer
//
//  Created by Paul Frank Pacheco Carpio on 10/08/23.
//

import Foundation
import AudioKit

struct MorphingOscillatorData {
	var isPlaying: Bool = false
	var frequency: AUValue = 440
	var octaveFrequency: AUValue = 440
	var amplitude: AUValue = 0.2
	var rampDuration: AUValue = 0.1
}
