//
//  GoalSettingView.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//
import SwiftUI

struct GoalSettingView: View {
    @State private var goal: String = ""
    @AppStorage("longTermGoal") private var savedGoal: String = ""
    
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    content
                }
            } else {
                NavigationView {
                    content
                }
            }
        }
    }
    
    var content: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Set Your Long-Term Goal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                TextField("Enter your goal (e.g., I want to be more productive in 2 years)", text: $goal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    savedGoal = goal
                }) {
                    Text("Save Goal")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(14)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("Goal Setting")
    }
}
