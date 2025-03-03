//
//  HealthDataManager.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//

import Foundation

class HealthDataManager {
    static let shared = HealthDataManager()
    
    var stressLevel: Double { return Double.random(in: 0...100) }
    var sleepHours: Double { return Double.random(in: 4...10) }
    var steps: Int { return Int.random(in: 1000...15000) }
    var heartRate: Int { return Int.random(in: 60...100) }
    var caloriesBurned: Int { return Int.random(in: 200...800) }
    var distance: Double { return Double.random(in: 1...10) }
    var hydration: Int { return Int.random(in: 500...3000) }
    
    var weeklySteps: Int { return Int.random(in: 70000...105000) }
    var weeklyCaloriesBurned: Int { return Int.random(in: 1400...5600) }
    var weeklyDistance: Double { return Double.random(in: 7...70) }
    
    var monthlySteps: Int { return Int.random(in: 300000...450000) }
    var monthlyCaloriesBurned: Int { return Int.random(in: 6000...24000) }
    var monthlyDistance: Double { return Double.random(in: 30...300) }
}
