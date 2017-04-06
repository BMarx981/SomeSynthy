//
//  FilterModel.swift
//  SomeSynthy
//
//  Created by Brian Marx on 4/5/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import AudioKit

class FilterModel {
    
    var lp = AKLowPassFilter()
    var bp = AKBandPassFilter()
    var hp = AKHighPassFilter()
    
    init(osc: AKOscillator) {
        lp = AKLowPassFilter(osc, cutoffFrequency: 1000)
        bp = AKBandPassFilter(osc, centerFrequency: 1000)
        hp = AKHighPassFilter(osc, cutoffFrequency: 1000)
    }
    
    func changeFreq(filterNum: Int, freq: Double) {
        switch filterNum {
        case 0:
            lp.frequency(freq: freq)
        case 1:
            bp.frequency(freq: freq)
        case 2:
            hp.frequency(freq: freq)
        default: break
        }
    }
    
    func changeRes(filterNum: Int, res: Double) {
        switch filterNum {
        case 0:
            lp.resonance = res
        case 1:
            bp.resonance(freq: res)
        case 2:
            hp.resonance = res
        default: break
        }
    }
}

//Extensions to the filters
extension AKLowPassFilter {
    override convenience init() {
        self.init()
    }
    
    func frequency(freq: Double) {
        cutoffFrequency = freq
    }
}

extension AKHighPassFilter {
    override convenience init() {
        self.init()
    }
    
    func frequency(freq: Double) {
        cutoffFrequency = freq
    }

}

extension AKBandPassFilter {
    override convenience init() {
        self.init()
    }
    
    func frequency(freq: Double) {
        centerFrequency = freq
    }
    
    func resonance(freq: Double) {
        bandwidth = freq
    }
}
