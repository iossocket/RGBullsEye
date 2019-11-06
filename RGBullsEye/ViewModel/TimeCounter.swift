//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by ZhuXueliang on 2019/10/30.
//  Copyright © 2019 iossocket. All rights reserved.
//

import Foundation

class TimeCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.counter += 1
        }
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
