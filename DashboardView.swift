//
//  DashboardView.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//
import SwiftUI

struct DashboardView: View {
    @State private var steps: Int = HealthDataManager.shared.steps
    @State private var caloriesBurned: Int = HealthDataManager.shared.caloriesBurned
    @State private var distance: Double = HealthDataManager.shared.distance
    @State private var heartRate: Int = HealthDataManager.shared.heartRate
    @State private var sleepDuration: Double = HealthDataManager.shared.sleepHours
    @State private var hydration: Int = HealthDataManager.shared.hydration
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Welcome, Kartik!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    VStack(spacing: 15) {
                        Text("Daily Progress")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            MetricCard(value: "\(steps)", label: "Steps", icon: "figure.walk", color: .blue)
                            MetricCard(value: "\(caloriesBurned)", label: "Calories", icon: "flame", color: .orange)
                        }
                        
                        HStack(spacing: 15) {
                            MetricCard(value: String(format: "%.1f km", distance), label: "Distance", icon: "map", color: .green)
                            MetricCard(value: "\(heartRate) BPM", label: "Heart Rate", icon: "heart", color: .red)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 15) {
                        Text("Health Metrics")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            MetricCard(value: String(format: "%.1f hrs", sleepDuration), label: "Sleep", icon: "moon.zzz", color: .purple)
                            MetricCard(value: "\(hydration) ml", label: "Hydration", icon: "drop", color: .blue)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 15) {
                        Text("Quick Actions")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            QuickActionButton(icon: "play.fill", label: "Start Workout", color: .green)
                            QuickActionButton(icon: "plus", label: "Log Water", color: .blue)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 15) {
                        Text("Weekly Progress")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 150)
                            .overlay(
                                Text("Chart Placeholder")
                                    .foregroundColor(.white.opacity(0.7))
                            )
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        NotificationManager.shared.scheduleNotification(
                            title: "Stay Hydrated!",
                            body: "Don't forget to drink water.",
                            timeInterval: 5
                        )
                    }) {
                        Text("Schedule Reminder")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(14)
                            .padding(.horizontal, 20)
                    }
                }
                .padding(.vertical, 20)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.05, green: 0.05, blue: 0.1),
                        Color(red: 0.12, green: 0.12, blue: 0.22)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("Dashboard", displayMode: .inline)
        }
    }
}

struct MetricCard: View {
    var value: String
    var label: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct QuickActionButton: View {
    var icon: String
    var label: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
            Text(label)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
