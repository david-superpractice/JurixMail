//
//  ContentView.swift
//  JurixMail
//
//  Created by David Scott on 11/16/24.
//

import SwiftUI
import AppKit // Import AppKit for macOS-specific font functionality

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Sidebar for Folders and Tasks
            List {
                Section(header: Text("Folders")) {
                    ForEach(["Inbox", "Important Emails", "Sent", "Drafts"], id: \.self) { folder in
                        Text(folder)
                    }
                }
                Section(header: Text("Tasks")) {
                    ForEach(["To-Do", "Follow Up"], id: \.self) { task in
                        Text(task)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("JurixMail")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        print("Compose email tapped")
                    }) {
                        Image(systemName: "square.and.pencil")
                        Text("Compose")
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        print("Settings tapped")
                    }) {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }
            
            // Main Email Display
            VStack {
                Text("Welcome to JurixMail")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Select a folder or task to get started.")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
