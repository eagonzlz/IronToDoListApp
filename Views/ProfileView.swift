//
//  ProfileView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ProfileViewModel

    @State private var tempName: String
    @State private var tempEmail: String

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        _tempName = State(initialValue: viewModel.name)
        _tempEmail = State(initialValue: viewModel.email)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("Name", text: $tempName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $tempEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.name = tempName
                        viewModel.email = tempEmail
                        viewModel.saveProfile()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
