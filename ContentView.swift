//
//  ContentView.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.05, green: 0.05, blue: 0.1),
                        Color(red: 0.12, green: 0.12, blue: 0.22)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 5) {
                    Spacer(minLength: 60)

                    Text("Welcome to SyncWell")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .padding(.horizontal, 30)

                    Text("Your personal health and wellness companion.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal, 30)

                    Spacer(minLength: 20)

                    VStack(spacing: 15) {
                        FeatureCard(icon: "chart.bar.fill", title: "Track Your Progress", description: "Monitor your health metrics and achieve your goals.")
                        FeatureCard(icon: "moon.fill", title: "Improve Sleep", description: "Get insights into your sleep patterns and improve your rest.")
                        FeatureCard(icon: "person.2.fill", title: "Stay Connected", description: "Share your progress and motivate your friends.")
                    }
                    .padding(.horizontal, 25)

                    Spacer()

                    NavigationLink(destination: PersonalizationView()) {
                        Text("Get Started")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(14)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                            .padding(.horizontal, 35)
                    }
                    .padding(.bottom, 50)
                }
            }
            .onAppear {
                NotificationManager.shared.requestPermission()
            }
        }
    }
}

struct FeatureCard: View {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
                .padding(10)
                .background(Color.white.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(description)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(14)
        .background(Color.white.opacity(0.08))
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 6)
    }
}
