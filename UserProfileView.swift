//
//  UserProfileView.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//

import SwiftUI

struct UserProfileView: View {
    @AppStorage("userName") private var userName: String = "Kartik"
    @AppStorage("userAge") private var userAge: String = "25"
    @AppStorage("userGender") private var userGender: String = "Male"
    @AppStorage("userHeight") private var userHeight: String = "175 cm"
    @AppStorage("userWeight") private var userWeight: String = "70 kg"
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Personal Information")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(userName)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text(userAge)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text(userGender)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Height")
                        Spacer()
                        Text(userHeight)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Weight")
                        Spacer()
                        Text(userWeight)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("User Profile")
        }
    }
}
