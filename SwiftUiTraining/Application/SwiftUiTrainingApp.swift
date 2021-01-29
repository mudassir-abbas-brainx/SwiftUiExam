//
//  SwiftUiTrainingApp.swift
//  SwiftUiTraining
//
//  Created by BrainX Technologies on 28/01/2021.
//

import SwiftUI

@main
struct SwiftUiTrainingApp: App {
    var body: some Scene {
        WindowGroup {
            let order = Order()
            AppView().environmentObject(order)
            
        }
    }
}
