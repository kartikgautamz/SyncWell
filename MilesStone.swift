//
//  MilesStone.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//

import SwiftUI

struct MilestonesView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Weekly Targets")) {
                    Text("Walk 10,000 steps daily")
                    Text("Sleep 7-8 hours nightly")
                    Text("Drink 2L of water daily")
                }
                
                Section(header: Text("Monthly Targets")) {
                    Text("Lose 2kg of weight")
                    Text("Run 50km this month")
                }
                
                Section(header: Text("Yearly Targets")) {
                    Text("Achieve a healthy BMI")
                    Text("Complete a marathon")
                }
            }
            .navigationTitle("Milestones")
        }
    }
}
