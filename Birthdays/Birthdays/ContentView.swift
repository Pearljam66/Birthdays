//
//  ContentView.swift
//  Birthdays
//
//  Created by Sarah Clark on 5/10/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query (sort: \Friend.birthdate) private var friends: [Friend]
    @Environment(\.modelContext) private var context

    @State private var newName = ""
    @State private var newDate = Date.now

    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }

                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthdate, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Buddy Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .leading) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthdate: newDate)
                        context.insert(newFriend)

                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
