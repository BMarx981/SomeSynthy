//
//  OscModel.swift
//  SomeSynthy
//
//  Created by Brian Marx on 4/5/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import AudioKit

class OscModel {
    
    let saw = AKOscillator(waveform: AKTable(.sawtooth))
    let square = AKOscillator(waveform: AKTable(.square))
    let sine = AKOscillator(waveform: AKTable(.sine))
    let triangle = AKOscillator(waveform: AKTable(.triangle))
    var oscs = [AKOscillator]()
    
    init() {
        oscs = [saw, square, sine, triangle]
    }
    
    func changeFreq(frequency: Double, oscNum: Int) {
        oscs[oscNum].frequency = frequency
    }
    
    func changeAmp(amp: Double, oscNum: Int) {
        oscs[oscNum].amplitude = amp
    }
    
    func stopOsc() {
        for osc in oscs {
            osc.stop()
        }
    }
    
    func startOsc() {
        for osc in oscs {
            osc.start()
        }
    }
    
}
