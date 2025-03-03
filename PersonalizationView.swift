//
//  PersonalizationView.swift
//  SyncWell
//
//  Created by Kartik Gautam on 03/03/25.
//

import SwiftUI

struct PersonalizationView: View {
    @State private var dob: String = "Not Set"
    @State private var gender: String = "Not Set"
    @State private var height: String = "Not Set"
    @State private var weight: String = "Not Set"
    
    @State private var selectedField: String?
    @State private var showEditSheet = false
    
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
                
                VStack(spacing: 10) {
                    Spacer(minLength: 60)

                    Text("Personalize Fitness and Health")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Text("This information ensures fitness and health data are as accurate as possible.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Spacer(minLength: 10)
                    
                    VStack(spacing: 0) {
                        PersonalizeOption(title: "Date of Birth", value: dob) { editField("Date of Birth") }
                        Divider().background(Color.white.opacity(0.3))
                        PersonalizeOption(title: "Gender", value: gender) { editField("Gender") }
                        Divider().background(Color.white.opacity(0.3))
                        PersonalizeOption(title: "Height", value: height) { editField("Height") }
                        Divider().background(Color.white.opacity(0.3))
                        PersonalizeOption(title: "Weight", value: weight) { editField("Weight") }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(14)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: DashboardView()) {
                        Text("Continue")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(allDataIsSet ? Color.blue.opacity(0.7) : Color.gray.opacity(0.3))
                            .cornerRadius(14)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 30)
                    .disabled(!allDataIsSet)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .sheet(isPresented: $showEditSheet) {
                EditFieldView(selectedField: $selectedField, value: getFieldValue(), onSave: { newValue in
                    setFieldValue(newValue)
                })
            }
        }
    }
    
    private var allDataIsSet: Bool {
        dob != "Not Set" && gender != "Not Set" && height != "Not Set" && weight != "Not Set"
    }
    
    private func editField(_ field: String) {
        selectedField = field
        showEditSheet = true
    }
    
    private func getFieldValue() -> String {
        switch selectedField {
        case "Date of Birth": return dob
        case "Gender": return gender
        case "Height": return height
        case "Weight": return weight
        default: return ""
        }
    }
    
    private func setFieldValue(_ newValue: String) {
        switch selectedField {
        case "Date of Birth": dob = newValue
        case "Gender": gender = newValue
        case "Height": height = newValue
        case "Weight": weight = newValue
        default: break
        }
    }
}

struct PersonalizeOption: View {
    var title: String
    var value: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(value == "Not Set" ? .gray : .white)
                .fontWeight(.bold)
                .onTapGesture {
                    action()
                }
        }
        .padding()
    }
}

struct EditFieldView: View {
    @Binding var selectedField: String?
    @State private var newValue: String = ""
    @State private var selectedDate: Date = Date()
    @State private var selectedGender: String = "Male"
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    var value: String
    var onSave: (String) -> Void
    
    @Environment(\.presentationMode) var presentationMode
    
    private var isDataValid: Bool {
        if selectedField == "Date of Birth" {
            return true
        } else if selectedField == "Gender" {
            return true
        } else if selectedField == "Height" || selectedField == "Weight" {
            guard let numericValue = Double(newValue) else { return false }
            if selectedField == "Height" {
                return numericValue >= 50 && numericValue <= 250
            } else if selectedField == "Weight" {
                return numericValue >= 10 && numericValue <= 300
            }
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Edit \(selectedField ?? "")")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Form {
                    Section {
                        if selectedField == "Date of Birth" {
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                                .onAppear {
                                    if let date = DateFormatter.shortDate.date(from: value) {
                                        selectedDate = date
                                    }
                                }
                        } else if selectedField == "Gender" {
                            Picker("Select Gender", selection: $selectedGender) {
                                Text("Male").tag("Male")
                                Text("Female").tag("Female")
                                Text("Other").tag("Other")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .onAppear {
                                selectedGender = value
                            }
                        } else if selectedField == "Height" || selectedField == "Weight" {
                            HStack {
                                TextField("Enter \(selectedField ?? "")", text: $newValue)
                                    .keyboardType(.decimalPad)
                                    .onAppear {
                                        newValue = value == "Not Set" ? "" : value
                                    }
                                
                                Text(selectedField == "Height" ? "cm" : "kg")
                                    .foregroundColor(.gray)
                            }
                            
                            if showError {
                                Text(errorMessage)
                                    .foregroundColor(.red)
                                    .font(.caption)
                            }
                        }
                    }
                    .listRowBackground(Color.gray.opacity(0.1))
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                
                Button(action: {
                    if selectedField == "Date of Birth" {
                        onSave(DateFormatter.shortDate.string(from: selectedDate))
                    } else if selectedField == "Gender" {
                        onSave(selectedGender)
                    } else if selectedField == "Height" || selectedField == "Weight" {
                        if validateInput() {
                            onSave(newValue)
                        }
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isDataValid ? Color.blue.opacity(0.7) : Color.gray.opacity(0.3))
                        .cornerRadius(14)
                        .padding(.horizontal, 20)
                }
                .disabled(!isDataValid)
                .padding(.bottom, 20)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    private func validateInput() -> Bool {
        guard let numericValue = Double(newValue) else {
            showError = true
            errorMessage = "Please enter a valid number."
            return false
        }
        
        if selectedField == "Height" {
            if numericValue < 50 || numericValue > 250 {
                showError = true
                errorMessage = "Height must be between 50 cm and 250 cm."
                return false
            }
        } else if selectedField == "Weight" {
            if numericValue < 10 || numericValue > 300 {
                showError = true
                errorMessage = "Weight must be between 10 kg and 300 kg."
                return false
            }
        }
        
        showError = false
        return true
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
