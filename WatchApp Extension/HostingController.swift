//
//  HostingController.swift
//  WatchApp Extension
//
//  Created by ZhuXueliang on 2019/11/16.
//  Copyright © 2019 iossocket. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import Game

class HostingController: WKHostingController<BullsEyeContentView> {
    override var body: BullsEyeContentView {
        return BullsEyeContentView()
    }
}
