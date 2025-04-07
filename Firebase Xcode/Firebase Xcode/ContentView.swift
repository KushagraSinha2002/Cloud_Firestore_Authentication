//
//  ContentView.swift
//  Firebase Xcode
//
//  Created by Kushagra Sinha on 30/03/25.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                //Add Document
                Task{
                    do {
                      try await db.collection("cities").document("CH").setData([
                        "name": "Chandigarh",
                        "population": 1
                      ])
                      print("Document successfully written!")
                    } catch {
                      print("Error writing document: \(error)")
                    }
                }
            } label: {
                Text("Add Channdigarh")
            }
            
            Button {
                //Add Field (state) to a Document (chandigarh)
                Task{
                    do {
                      try await db.collection("cities").document("CH").setData([
                        "name": "Chandigarh",
                        "state": "Chandigarh"
                      ], merge: true)
                      print("Document successfully written!")
                    } catch {
                      print("Error writing document: \(error)")
                    }
                }
            } label: {
                Text("Add state of Channdigarh")
            }
            
            Button {
                //Delete Document (Channdigarh)
                Task{
                    do {
                      try await db.collection("cities").document("CH").delete()
                      print("Document deleted successfully!")
                    } catch {
                      print("Error writing document: \(error)")
                    }
                }
            } label: {
                Text("Delete Channdigarh")
            }
            
            Button {
                // Delete 'state' field of Chandigarh
                Task {
                    do {
                        try await db.collection("cities").document("CH").updateData([
                            "state": FieldValue.delete()
                        ])
                        print("State field deleted successfully!")
                    } catch {
                        print("Error deleting field: \(error)")
                    }
                }
            } label: {
                Text("Delete state of Chandigarh")
            }
            
            Button {
                // Add new document using City Struct
                let cityToAdd: City = City(name: "Pune", state: "Maharashtra", country: ("India"), population:  10)
                Task {
                    do {
                        try await db.collection("cities").document(cityToAdd.name).setData(cityToAdd.toDictionary())
                        print("Document successfully written!")
                    } catch {
                        print("Error writing document: \(error)")
                    }
                }
            } label: {
                Text("Add new document using City Struct")
            }

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
